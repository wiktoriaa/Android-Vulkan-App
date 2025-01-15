//
// Created by Lenovo on 15.01.2025.
//
#ifndef MODEL_LOADER_H
#define MODEL_LOADER_H

#include <string>

class ModelLoader {
public:
    void loadModel(const std::string& path);

private:
    void processNode(void* node, void* scene); // W zależności od Assimp użyj poprawnych typów
    void processMesh(void* mesh, void* scene);
};

#endif // MODEL_LOADER_H
