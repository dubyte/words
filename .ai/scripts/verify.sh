#!/usr/bin/env bash
set -uo pipefail

# verify.sh — Check structural consistency of a novel project
# Usage: .ai/scripts/verify.sh [project-name]
#        If no name given, reads .ai/.current_project

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

pass=0
fail=0

check() { printf "  %s ... " "$1"; }
ok()   { echo -e "${GREEN}OK${NC}"; ((pass++)); }
err()  { echo -e "${RED}FAIL${NC} — $1"; ((fail++)); }
warn() { echo -e "${YELLOW}WARN${NC} — $1"; }

PROJECT="${1:-}"
if [ -z "$PROJECT" ]; then
  PROJECT=$(cat .ai/.current_project 2>/dev/null || true)
fi
if [ -z "$PROJECT" ] || [ ! -d "$PROJECT" ]; then
  echo "Usage: .ai/scripts/verify.sh <project-name>"
  exit 1
fi

echo "=== verify: $PROJECT ==="
echo ""

# 1. Chapter count = outline count
check "Chapters vs outlines count"
ch_count=$(ls "$PROJECT"/chapters/chapter_*/draft.md 2>/dev/null | wc -l)
out_count=$(ls "$PROJECT"/plot/chapter_outlines/chapter_*_detailed.md 2>/dev/null | wc -l)
if [ "$ch_count" -eq "$out_count" ]; then
  ok
else
  err "chapters=$ch_count outlines=$out_count"
fi

# 2. Chapter directories match outline files exactly
check "Chapters match outlines (diff)"
diff_out=$(diff \
  <(ls "$PROJECT"/chapters/chapter_*/draft.md | sed 's|.*/chapter_||;s|/draft.md||' | sort -V) \
  <(ls "$PROJECT"/plot/chapter_outlines/chapter_*_detailed.md | sed 's|.*/chapter_||;s|_detailed.md||' | sort -V) 2>&1) || true
if [ -z "$diff_out" ]; then
  ok
else
  err "mismatch:"
  echo "$diff_out" | sed 's/^/      /'
fi

# 3. All outlines use 3-digit naming
check "Outline naming (3-digit zero-padded)"
bad_names=$(ls "$PROJECT"/plot/chapter_outlines/chapter_*_detailed.md 2>/dev/null | grep -v 'chapter_[0-9][0-9][0-9][ab]\?_detailed.md' || true)
if [ -z "$bad_names" ]; then
  ok
else
  err "non-3-digit names found:"
  echo "$bad_names" | sed 's/^/      /'
fi

# 4. Word counts (no cap below 2500w; flag above 3500w unless climax)
echo ""
echo "--- Word counts ---"
min_w=2500
max_w=3500
climax_w=4800
over=0
under=0
for f in $(ls "$PROJECT"/chapters/chapter_*/draft.md | sort -t/ -k3 -V); do
  ch=$(echo "$f" | sed 's|.*/chapter_||;s|/draft.md||')
  wc=$(wc -w < "$f")
  if [ "$wc" -lt "$min_w" ]; then
    printf "  ${RED}%-8s %6dw${NC}  BELOW %d\n" "$ch" "$wc" "$min_w"
    ((under++)) || true
  elif [ "$wc" -gt "$climax_w" ]; then
    printf "  ${RED}%-8s %6dw${NC}  WAY OVER %d\n" "$ch" "$wc" "$climax_w"
  elif [ "$wc" -gt "$max_w" ]; then
    printf "  ${YELLOW}%-8s %6dw${NC}  over %d (verify exception)\n" "$ch" "$wc" "$max_w"
    ((over++)) || true
  else
    printf "  ${GREEN}%-8s %6dw${NC}\n" "$ch" "$wc"
  fi
done
echo ""
if [ "$under" -gt 0 ]; then echo -e "  ${RED}$under chapter(s) below $min_w words${NC}"; fi
if [ "$over" -gt 0 ]; then echo -e "  ${YELLOW}$over chapter(s) over $max_w words — verify documented as exception${NC}"; fi
if [ "$under" -eq 0 ] && [ "$over" -eq 0 ]; then echo "  All chapters in range."; fi

# 5. Total words
echo ""
total=$(find "$PROJECT"/chapters -name "draft.md" -exec cat {} + | wc -w)
echo "  Total: $total words | $ch_count chapters"

echo ""
if [ "$fail" -gt 0 ]; then
  echo -e "${RED}$fail check(s) FAILED${NC}"
  exit 1
else
  echo -e "${GREEN}All structural checks passed${NC}"
fi
