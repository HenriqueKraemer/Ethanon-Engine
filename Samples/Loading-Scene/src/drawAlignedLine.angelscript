void drawAlignedLine(const vector2 &in pos, const string &in text, const string &in font,
						const uint color, const vector2 &in alignmentOrigin,
							const float scale, const vector2 &in selfFullTextBoxSize)
{
	DrawText(pos - (selfFullTextBoxSize * alignmentOrigin), text, font, color, scale);
}

void drawAlignedLine(const vector2 &in pos, const string &in text, const string &in font,
						const uint color, const vector2 alignmentOrigin, const float scale = 1.0f)
{
	const vector2 fullTextBoxSize(::ComputeTextBoxSize(font, text) * scale);
	drawAlignedLine(pos, text, font, color, alignmentOrigin, scale, fullTextBoxSize);
}