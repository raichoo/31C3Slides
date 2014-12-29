SNIPS = ValuesValues.html \
				TypesValues.html \
				TypesTypes.html \
				ValuesTypes.html \
				Vector.html \
				LEM.html \
				Conjunction.html \
				Disjunction.html \
				Falsity.html \
				Truth.html \
				Universal.html \
				Existential.html \
				Negation.html \
				Proof.html \
				Implication.html

TypeConditional.html: examples/TypeConditional.cpp
	pygmentize -l cpp -f html $< > partials/$@

%.html: examples/%.idr
	idris --check $<
	pygmentize -l idris -f html $< > partials/$@

talk.js:
	idris --codegen javascript Main.idr -o js/$@

all: $(SNIPS) TypeConditional.html talk.js

clean:
	rm *.ibc
	rm **/*.ibc
	rm partials/*.html
