BUILD := build
TEX := paper/main.tex

.PHONY: pdf clean check

pdf:
	mkdir -p $(BUILD)
	latexmk -pdf -interaction=nonstopmode -halt-on-error \
		-output-directory=$(abspath $(BUILD)) $(TEX)

check: pdf
	@test "$$(pdfinfo $(BUILD)/main.pdf | awk '/^Pages:/ {print $$2}')" -le 5 || \
		{ echo "paper exceeds five pages"; exit 1; }
	@! grep -E 'LaTeX Warning: (Reference|Citation).*undefined|There were undefined references' \
		$(BUILD)/main.log

clean:
	rm -rf $(BUILD)

