group "default" {
  targets = ["base", "claude", "codex", "gemini", "opencode", "pi", "hermes"]
}

variable "VERSION" { default = "dev" }
variable "REGISTRY" { default = "ghcr.io/paperclipai" }
variable "STABLE_VERSION" { default = "" }

target "base" {
  context = "."
  dockerfile = "docker/agent-runtime/Dockerfile.base"
  platforms = ["linux/amd64"]
  tags = STABLE_VERSION == "" ? ["${REGISTRY}/agent-runtime-base:${VERSION}"] : ["${REGISTRY}/agent-runtime-base:${VERSION}", "${REGISTRY}/agent-runtime-base:${STABLE_VERSION}"]
}

target "claude" {
  context = "."
  dockerfile = "docker/agent-runtime/Dockerfile.claude"
  platforms = ["linux/amd64"]
  tags = STABLE_VERSION == "" ? ["${REGISTRY}/agent-runtime-claude:${VERSION}"] : ["${REGISTRY}/agent-runtime-claude:${VERSION}", "${REGISTRY}/agent-runtime-claude:${STABLE_VERSION}"]
  args = { BASE_TAG = "${VERSION}" }
  contexts = { "paperclipai/agent-runtime-base:${VERSION}" = "target:base" }
}

target "codex" {
  context = "."
  dockerfile = "docker/agent-runtime/Dockerfile.codex"
  platforms = ["linux/amd64"]
  tags = STABLE_VERSION == "" ? ["${REGISTRY}/agent-runtime-codex:${VERSION}"] : ["${REGISTRY}/agent-runtime-codex:${VERSION}", "${REGISTRY}/agent-runtime-codex:${STABLE_VERSION}"]
  args = { BASE_TAG = "${VERSION}" }
  contexts = { "paperclipai/agent-runtime-base:${VERSION}" = "target:base" }
}

target "gemini" {
  context = "."
  dockerfile = "docker/agent-runtime/Dockerfile.gemini"
  platforms = ["linux/amd64"]
  tags = STABLE_VERSION == "" ? ["${REGISTRY}/agent-runtime-gemini:${VERSION}"] : ["${REGISTRY}/agent-runtime-gemini:${VERSION}", "${REGISTRY}/agent-runtime-gemini:${STABLE_VERSION}"]
  args = { BASE_TAG = "${VERSION}" }
  contexts = { "paperclipai/agent-runtime-base:${VERSION}" = "target:base" }
}

target "opencode" {
  context = "."
  dockerfile = "docker/agent-runtime/Dockerfile.opencode"
  platforms = ["linux/amd64"]
  tags = STABLE_VERSION == "" ? ["${REGISTRY}/agent-runtime-opencode:${VERSION}"] : ["${REGISTRY}/agent-runtime-opencode:${VERSION}", "${REGISTRY}/agent-runtime-opencode:${STABLE_VERSION}"]
  args = { BASE_TAG = "${VERSION}" }
  contexts = { "paperclipai/agent-runtime-base:${VERSION}" = "target:base" }
}

target "pi" {
  context = "."
  dockerfile = "docker/agent-runtime/Dockerfile.pi"
  platforms = ["linux/amd64"]
  tags = STABLE_VERSION == "" ? ["${REGISTRY}/agent-runtime-pi:${VERSION}"] : ["${REGISTRY}/agent-runtime-pi:${VERSION}", "${REGISTRY}/agent-runtime-pi:${STABLE_VERSION}"]
  args = { BASE_TAG = "${VERSION}" }
  contexts = { "paperclipai/agent-runtime-base:${VERSION}" = "target:base" }
}

target "hermes" {
  context = "."
  dockerfile = "docker/agent-runtime/Dockerfile.hermes"
  platforms = ["linux/amd64"]
  tags = ["${REGISTRY}/agent-runtime-hermes:${VERSION}"]
  args = { BASE_TAG = "${VERSION}" }
  contexts = { "paperclipai/agent-runtime-base:${VERSION}" = "target:base" }
}
