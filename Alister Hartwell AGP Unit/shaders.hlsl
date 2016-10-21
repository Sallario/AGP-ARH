cbuffer CBuffer0
{
	float red_fraction; // 4 bytes
	float scale;		// 4 bytes 
	float2 packing;		// 2x4 bytes = 8 bytes
}


struct VOut
{
	float4 position : SV_POSITION;
	float4 color	: COLOR;
};

VOut VShader(float4 position : POSITION, float4 color : COLOR)
{
	VOut output;

	color.r *= red_fraction;
	output.position = position;
	output.color = color;

	return output;
}

float4 PShader(float4 position: SV_POSITION, float4 color: COLOR) : SV_TARGET
{
	return color;
}