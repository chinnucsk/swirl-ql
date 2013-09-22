PROJECT=swirl-ql
REBAR=./rebar

all: compile

build-plt: all
	@dialyzer --build_plt --output_plt ~/.$(PROJECT).plt \
		--apps erts kernel stdlib crypto public_key ssl

check-plt:
	@dialyzer --check_plt --plt ~/.$(PROJECT).plt

clean:
	@$(REBAR) clean

compile:
	@echo "Running rebar compile..."
	@$(REBAR) compile

dialyze:
	@dialyzer ebin/*.beam --plt ~/.$(PROJECT).plt

eunit:
	@echo "Running EUnit suite..."
	@$(REBAR) skip_deps=true eunit

test: all eunit
