#version 450

// Input texture coordinates from the vertex shader
layout(location = 0) in vec3 vTexCoords;

// Uniform sampler for texture binding
layout(binding = 1) uniform sampler2D samp;

// Output color
layout(location = 0) out vec4 outColor;

void main() {
    vec4 texColor = texture(samp, vec2(vTexCoords.x, vTexCoords.y));
    float alpha = 0.5; // Set partial transparency (0.0 = fully transparent, 1.0 = fully opaque)
    outColor = vec4(texColor.rgb, texColor.a * alpha);
}
