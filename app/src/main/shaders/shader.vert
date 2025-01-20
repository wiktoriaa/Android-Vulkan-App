#version 450

// Colour passed to the fragment shader
layout(location = 0) out vec3 fragColor;

// Uniform buffer containing an MVP matrix.
// Currently the vulkan backend only sets the rotation matix
// required to handle device rotation.
layout(binding = 0) uniform UniformBufferObject {
    mat4 MVP;
} ubo;

vec3 positions[36] = vec3[](
    // Front face (czerwony) OK
    vec3(0.5, -0.25, 0.25), // Prawy dolny
    vec3(0.5, 0.25, 0.25),  // Prawy górny
    vec3(-0.5, 0.25, 0.25), // Lewy górny

    vec3(0.5, -0.25, 0.25), // Prawy dolny
    vec3(-0.5, 0.25, 0.25), // Lewy górny
    vec3(-0.5, -0.25, 0.25),// Lewy dolny

    // Back face (zielony) OK
    vec3(0.5, -0.25, -0.25),// Prawy dolny
    vec3(0.5, 0.25, -0.25), // Prawy górny
    vec3(-0.5, 0.25, -0.25),// Lewy górny

    vec3(0.5, -0.25, -0.25),// Prawy dolny
    vec3(-0.5, 0.25, -0.25),// Lewy górny
    vec3(-0.5, -0.25, -0.25),// Lewy dolny

    // Left face (niebieski) OK
    vec3(-0.5, -0.25, 0.25),// Prawy dolny
    vec3(-0.5, 0.25, 0.25), // Prawy górny
    vec3(-0.5, 0.25, -0.25),// Lewy górny

    vec3(-0.5, -0.25, 0.25),// Prawy dolny
    vec3(-0.5, 0.25, -0.25),// Lewy górny
    vec3(-0.5, -0.25, -0.25),// Lewy dolny

    // Right face (żółty) OK
    vec3(0.5, -0.25, 0.25), // Prawy dolny
    vec3(0.5, 0.25, 0.25),  // Prawy górny
    vec3(0.5, 0.25, -0.25), // Lewy górny

    vec3(0.5, -0.25, 0.25), // Prawy dolny
    vec3(0.5, 0.25, -0.25), // Lewy górny
    vec3(0.5, -0.25, -0.25),// Lewy dolny

    // Top face (pomarańczowy)
    vec3(0.5, 0.25, 0.25),  // Prawy górny
    vec3(0.5, 0.25, -0.25), // Lewy górny
    vec3(-0.5, 0.25, -0.25),// Lewy górny

    vec3(0.5, 0.25, 0.25),  // Prawy górny
    vec3(-0.5, 0.25, -0.25),// Lewy górny
    vec3(-0.5, 0.25, 0.25), // Lewy dolny

    // Bottom face (fioletowy) OK
    vec3(0.5, -0.25, 0.25),  // Prawy dolny
    vec3(0.5, -0.25, -0.25), // Lewy dolny
    vec3(-0.5, -0.25, -0.25),// Lewy dolny

    vec3(0.5, -0.25, 0.25),  // Prawy dolny
    vec3(-0.5, -0.25, -0.25),// Lewy dolny
    vec3(-0.5, -0.25, 0.25)  // Lewy dolny
);

vec3 colors[36] = vec3[](
    // Front face (czerwony) OK
    vec3(1.0, 0.0, 0.0),
    vec3(1.0, 0.0, 0.0),
    vec3(1.0, 0.0, 0.0),
    vec3(1.0, 0.0, 0.0),
    vec3(1.0, 0.0, 0.0),
    vec3(1.0, 0.0, 0.0),

    // Back face (zielony) OK
    vec3(0.0, 1.0, 0.0),
    vec3(0.0, 1.0, 0.0),
    vec3(0.0, 1.0, 0.0),
    vec3(0.0, 1.0, 0.0),
    vec3(0.0, 1.0, 0.0),
    vec3(0.0, 1.0, 0.0),

    // Left face (niebieski) OK
    vec3(0.0, 0.0, 1.0),
    vec3(0.0, 0.0, 1.0),
    vec3(0.0, 0.0, 1.0),
    vec3(0.0, 0.0, 1.0),
    vec3(0.0, 0.0, 1.0),
    vec3(0.0, 0.0, 1.0),

    // Right face (żółty)
    vec3(1.0, 1.0, 0.0),
    vec3(1.0, 1.0, 0.0),
    vec3(1.0, 1.0, 0.0),
    vec3(1.0, 1.0, 0.0),
    vec3(1.0, 1.0, 0.0),
    vec3(1.0, 1.0, 0.0),

    // Top face (pomarańczowy)
    vec3(1.0, 0.65, 0.0),
    vec3(1.0, 0.65, 0.0),
    vec3(1.0, 0.65, 0.0),
    vec3(1.0, 0.65, 0.0),
    vec3(1.0, 0.65, 0.0),
    vec3(1.0, 0.65, 0.0),

    // Bottom face (fioletowy)
    vec3(0.5, 0.0, 1.0),
    vec3(0.5, 0.0, 1.0),
    vec3(0.5, 0.0, 1.0),
    vec3(0.5, 0.0, 1.0),
    vec3(0.5, 0.0, 1.0),
    vec3(0.5, 0.0, 1.0)
);

void main() {
    gl_Position = ubo.MVP * vec4(positions[gl_VertexIndex], 1.0);
    fragColor = colors[gl_VertexIndex];
}