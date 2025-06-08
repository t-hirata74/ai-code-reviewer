# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is the ai-code-reviewer project, which is currently in its initial setup phase. The project aims to provide AI-powered code review functionality.

## Current State

The repository is newly initialized with:
- Basic git setup with remote: `git@github.com:t-hirata74/ai-code-reviewer.git`
- Claude permissions configured in `.claude/settings.local.json` allowing git pull, ls, and find commands
- No implementation code or project structure yet established

## Development Setup

Since the project has not yet been implemented, the first steps when working on this codebase should be:

1. **Determine the technology stack** based on user requirements (e.g., Python, Node.js, Go)
2. **Initialize the project** with appropriate configuration files (package.json, requirements.txt, etc.)
3. **Set up the project structure** following best practices for the chosen technology
4. **Configure development tools** including:
   - Testing framework
   - Linting and formatting tools
   - Build/compilation process if needed
   - CI/CD pipeline

## Architecture Considerations

When implementing the ai-code-reviewer:

1. **Core Components** to consider:
   - Code parsing and analysis engine
   - AI integration layer (API clients for LLMs)
   - Review rule configuration system
   - Output formatting and reporting
   - Version control integration (Git)

2. **Key Design Decisions** to make:
   - CLI vs. Web interface vs. API service
   - Local processing vs. cloud-based
   - Supported programming languages
   - Integration points (GitHub, GitLab, etc.)

## Commands

Commands will be established once the technology stack is chosen. Typical commands to implement:

- **Build**: Compile/prepare the application
- **Test**: Run the test suite
- **Lint**: Check code quality
- **Run**: Execute the code reviewer

## Notes

- The repository has Claude-specific permissions configured to allow basic file system operations
- When setting up the project, ensure to update this file with actual commands and architecture details
- Consider security implications when handling code review data and API keys