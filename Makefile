BUILD := build
TEX := paper/main.tex
NOTE := paper/almost-all.tex

.PHONY: pdf almost-all clean check check-note

pdf:
	mkdir -p $(BUILD)
	latexmk -pdf -interaction=nonstopmode -halt-on-error \
		-output-directory=$(abspath $(BUILD)) $(TEX)

almost-all:
	mkdir -p $(BUILD)
	latexmk -pdf -interaction=nonstopmode -halt-on-error \
		-output-directory=$(abspath $(BUILD)) $(NOTE)

check: pdf
	@test "$$(pdfinfo $(BUILD)/main.pdf | awk '/^Pages:/ {print $$2}')" -le 5 || \
		{ echo "paper exceeds five pages"; exit 1; }
	@! grep -E 'LaTeX Warning: (Reference|Citation).*undefined|There were undefined references' \
		$(BUILD)/main.log

check-note: almost-all
	@test "$$(pdfinfo $(BUILD)/almost-all.pdf | awk '/^Pages:/ {print $$2}')" -le 4 || \
		{ echo "note exceeds four pages"; exit 1; }
	@! grep -E 'LaTeX Warning: (Reference|Citation).*undefined|There were undefined references' \
		$(BUILD)/almost-all.log

clean:
	rm -rf $(BUILD)
