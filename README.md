# Biblioteca Piloto del Caribe — Laboratorio de campo CLENA

> Identificación de problemas y oportunidades de solución tecnológica en el CLENA (Aduana de Barranquilla).

| Campo | Valor |
|---|---|
| **Curso** | Introducción a la Ingeniería de Sistemas y Computación — Universidad del Norte |
| **Docente** | Daniel Romero |
| **Espacio del CLENA estudiado** | Biblioteca Piloto del Caribe |
| **Fecha de la visita** | [26/09/2026] |
| **Sprint** | Sprint 1 — [fecha inicio] a [fecha fin] |

## Integrantes y roles

| Integrante | Rol Scrum | Responsabilidad adicional | Usuario GitHub |
|---|---|---|---|
| Santiago Barros | Product Owner | Prioriza el backlog y valida el problema seleccionado | @[usuario] |
| Iván Gómez | Scrum Master | Convoca y documenta las ceremonias en Teams | @[usuario] |
| Samuel Pimienta | Development Team | Responsable de evidencias (fotos y videos) | @[usuario] |
| Juan Riaño | Development Team | Responsable de documentación y administración del repo | @Jrianopro20 |

Todos los integrantes forman parte del Development Team. Los roles no son jerárquicos.

## Descripción breve

Observamos la **Biblioteca Piloto del Caribe** durante la visita al CLENA. Encontramos que su colección de **libros antiguos** solo puede consultarse manipulando ejemplares únicos y frágiles, en un proceso manual y restringido, lo que limita el acceso a ese patrimonio y lo expone al deterioro. Proponemos **digitalizar la colección** y publicarla en un **catálogo web con códigos QR** en sala, para que cualquiera pueda consultar el contenido sin tocar el original.

> **Nota sobre evidencias:** durante la visita (26/09/2026) el equipo no tomó fotografías porque aún no conocía los requisitos de este laboratorio. Las evidencias son registro testimonial de los integrantes e imágenes de referencia con fuente citada. Ver `evidencias/`.

## Estructura del repositorio

```
├── README.md
├── docs/                      # Ceremonias Scrum, contexto y guía de visita
├── problema/                  # Observaciones, problemas identificados y problema seleccionado
├── propuesta/                 # Propuesta de solución tecnológica
├── evidencias/
│   ├── fotografias/
│   ├── videos/
│   └── evidencias-scrum/      # Capturas de Teams, GitHub Project, PRs
├── informe/                   # Informe final y reflexiones individuales
├── presentacion/              # Guion de la presentación (10 min)
└── scripts/                   # Script de configuración de GitHub
```

## Flujo de trabajo (GitHub Flow)

1. Crear rama desde `main`: `git checkout -b feature/<tema>`
2. Modificar archivos y hacer commit: `git commit -m "Descripción clara"`
3. Subir la rama: `git push origin feature/<tema>`
4. Abrir Pull Request y asignar a **otro** integrante como revisor
5. Revisión → aprobación → merge a `main`

**Nadie hace push directo a `main`.**

## Proceso

OBSERVAR → IDENTIFICAR → COMPRENDER → FORMULAR EL PROBLEMA → IDENTIFICAR USUARIOS → ANALIZAR NECESIDADES → PROPONER SOLUCIÓN → DOCUMENTAR → PRESENTAR
