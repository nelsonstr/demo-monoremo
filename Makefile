all: install

.PHONY: all help install install_linux install_macos install_pip install_precommit run_precommit

install: install_linux install_macos install_precommit install_asdf_golang install_goreturns

# Install asdf if not already installed on Linux
install_linux:
	@if [ "$(shell uname)" = "Linux" ]; then \
  		if [ ! -d "$$HOME/.asdf" ]; then \
			git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.11.3; \
			echo -e '\n. $HOME/.asdf/asdf.sh' >> ~/.bashrc; \
			echo -e '\n. $HOME/.asdf/completions/asdf.bash' >> ~/.bashrc; \
			source ~/.bashrc; \
			echo "asdf installed"; \
		else \
			echo "asdf already installed"; \
		fi \
	fi

# Install asdf if not already installed on macOS
install_macos:
	@if [ "$(shell uname)" = "Darwin" ]; then \
  		if [ ! -d "$$HOME/.asdf" ]; then \
			git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.11.3; \
			echo -e '\n. $HOME/.asdf/asdf.sh' >> ~/.bash_profile; \
			echo -e '\n. $HOME/.asdf/completions/asdf.bash' >> ~/.bash_profile; \
			source ~/.bash_profile; \
			echo "asdf installed"; \
		else \
			echo "asdf already installed"; \
		fi \
	fi

# Install asdf Golang plugin
install_asdf_golang:
	@asdf plugin-add golang || true
	@echo "Golang plugin installed"

 # Install goreturns for golangci-lint
install_goreturns:
	@go install github.com/sqs/goreturns@latest
	@echo "goreturns installed"


# Install pre-commit
install_precommit:
	@pip install --user pre-commit

enable_precommit_hook:
	pre-commit install


# Run pre-commit on all files
run_precommit_all:
	pre-commit run --all-files

# Run pre-commit on staged files
run_precommit:
	pre-commit run
