#version 450

// Colour passed to the fragment shader
layout(location = 0) in vec3 inPosition;
layout(location = 1) in vec2 inTexCoord;

layout(location = 0) out vec2 uv;

// Uniform buffer containing an MVP matrix.
// Currently the vulkan backend only sets the rotation matix
// required to handle device rotation.
layout(set = 0, binding = 0) uniform MVP {
    mat4 model;
    mat4 view;
    mat4 proj;
};

void main() {
    vec2 pos[] = vec2[](
    vec2(-1.0, -1.0),
    vec2(1.0, -1.0),
    vec2(-1.0, 1.0),
    vec2(1.0, 1.0)
    );
    uv = pos[gl_VertexIndex].xy * 0.5 + 0.5;
    gl_Position = vec4(pos[gl_VertexIndex], 0.0, 1.0);
}