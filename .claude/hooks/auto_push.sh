#!/bin/bash
# Auto-commit e push ao final de cada sessão Claude Code

REPO="/Users/pvsmacbookpro/ClaudeCodePV/Doces&Talentos"

cd "$REPO" || exit 0

# Só actua se houver alterações
if git diff --quiet && git diff --cached --quiet; then
  exit 0
fi

# Ler versão actual e incrementar
CURRENT=$(grep -o "numero: '[0-9]*'" index.html | grep -o "[0-9]*")
NEXT=$(printf "%02d" $((10#$CURRENT + 1)))

# Data de hoje em português
MONTH_NUM=$(date +%-m)
MONTHS=("" "janeiro" "fevereiro" "março" "abril" "maio" "junho" "julho" "agosto" "setembro" "outubro" "novembro" "dezembro")
TODAY="$(date +%-d) de ${MONTHS[$MONTH_NUM]} de $(date +%Y)"

# Bumpar versão no index.html
sed -i '' "s/numero: '[0-9]*'/numero: '$NEXT'/" index.html
sed -i '' "s/data: '[^']*'/data: '$TODAY'/" index.html

# Commit e push
git add index.html
git commit -m "Auto-push v${NEXT} — $(date '+%d/%m/%Y %H:%M')

Co-Authored-By: Claude Sonnet 4.6 <noreply@anthropic.com>"
git push origin main
