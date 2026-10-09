#!/usr/bin/env bash
# Wrapper do Claude Code para o claudecode.nvim.
# O plugin não passa pelo shell, então as funções do claude-gateway.sh
# (claude/glm/k3, com ANTHROPIC_BASE_URL/AUTH_TOKEN/MODEL por token/API,
# não por login) não são aplicadas. Nota: o source do gateway apenas define
# as funções — as variáveis ficam nos corpos delas e NÃO são exportadas.
# Este wrapper injeta as variáveis diretamente, como as funções fazem.

GATEWAY="$HOME/.config/factory/keys/pf-gateway"

if [ ! -r "$GATEWAY" ]; then
  printf "%s\n" "claudecode.nvim: chave não encontrada em $GATEWAY. Rode o instalador do ProductFactory de novo." >&2
  exec claude "$@"
fi

# Modelo padrão: glm-5.3-flash. Pode ser sobrescrito passando --model
# depois, ou via /model dentro da sessão.
MODEL="glm-5.3-flash"

ANTHROPIC_BASE_URL='https://productfactory-stg.rdstation.com.br/llm' \
ANTHROPIC_AUTH_TOKEN="$(cat "$GATEWAY")" \
ANTHROPIC_MODEL="${MODEL:-glm-5.3-flash}" \
CLAUDE_CODE_MAX_CONTEXT_TOKENS='500000' \
exec claude "$@"
