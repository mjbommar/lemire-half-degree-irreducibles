BUILD := build
TEX := paper/main.tex
NOTE := paper/almost-all.tex
BARRIERS := paper/barriers.tex

.PHONY: pdf almost-all barriers clean check check-note check-barriers

pdf:
	mkdir -p $(BUILD)
	latexmk -pdf -interaction=nonstopmode -halt-on-error \
		-output-directory=$(abspath $(BUILD)) $(TEX)

almost-all:
	mkdir -p $(BUILD)
	latexmk -pdf -interaction=nonstopmode -halt-on-error \
		-output-directory=$(abspath $(BUILD)) $(NOTE)

check: pdf
	@test "$$(pdfinfo $(BUILD)/main.pdf | awk '/^Pages:/ {print $$2}')" -le 3 || \
		{ echo "note exceeds three pages"; exit 1; }
	@! grep -E 'LaTeX Warning: (Reference|Citation).*undefined|There were undefined references' \
		$(BUILD)/main.log

check-note: almost-all
	@test "$$(pdfinfo $(BUILD)/almost-all.pdf | awk '/^Pages:/ {print $$2}')" -le 4 || \
		{ echo "note exceeds four pages"; exit 1; }
	@! grep -E 'LaTeX Warning: (Reference|Citation).*undefined|There were undefined references' \
		$(BUILD)/almost-all.log

barriers:
	mkdir -p $(BUILD)
	latexmk -pdf -interaction=nonstopmode -halt-on-error \
		-output-directory=$(abspath $(BUILD)) $(BARRIERS)

check-barriers: barriers
	@! grep -E 'LaTeX Warning: (Reference|Citation).*undefined|There were undefined references' \
		$(BUILD)/barriers.log

clean:
	rm -rf $(BUILD)
