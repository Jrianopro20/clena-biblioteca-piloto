# Cómo montar el repositorio (paso a paso)

## 1. Crear el repo
1. En GitHub: **New repository**, con nombre `clena-laboratorio` (o el que escojan), **sin** README.
2. En el computador, dentro de esta carpeta:
```bash
git init
git add .
git commit -m "Estructura inicial del laboratorio CLENA"
git branch -M main
git remote add origin https://github.com/<usuario>/clena-laboratorio.git
git push -u origin main
```

## 2. Crear issues, Project y ramas automáticamente
```bash
gh auth login
gh auth refresh -s project
bash scripts/setup-github.sh
```
En Windows, ejecútalo desde **Git Bash**.

## 3. Lo que cada integrante hace para aportar
```bash
git clone https://github.com/<usuario>/clena-laboratorio.git
cd clena-laboratorio
git checkout -b feature/mi-tarea
# editar archivos
git add .
git commit -m "Describe el cambio"
git push origin feature/mi-tarea
```
Luego abre el Pull Request en GitHub, asigna a otro integrante como revisor y, cuando lo apruebe, hace merge.

**Importante:** cada integrante debe tener commits y PRs propios. No conviene que una sola persona suba todo, porque se evalúa.
