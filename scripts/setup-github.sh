#!/usr/bin/env bash
# Crea labels, issues, el GitHub Project con columnas y las ramas de trabajo.
# Requisitos: GitHub CLI (https://cli.github.com) autenticado con:
#   gh auth login
#   gh auth refresh -s project
# Uso (desde la raíz del repo ya subido a GitHub):
#   bash scripts/setup-github.sh
set -e

OWNER=$(gh repo view --json owner -q .owner.login)
REPO=$(gh repo view --json name -q .name)
echo "Repo: $OWNER/$REPO"

# ---------- Labels ----------
gh label create "prioridad: alta"  --color B60205 --force
gh label create "prioridad: media" --color FBCA04 --force
gh label create "prioridad: baja"  --color 0E8A16 --force
gh label create "documentación"    --color 1D76DB --force
gh label create "evidencias"       --color 5319E7 --force
gh label create "problema"         --color D93F0B --force
gh label create "propuesta"        --color 0052CC --force
gh label create "scrum"            --color C5DEF5 --force

# ---------- Issues ----------
# formato: "titulo|descripcion|labels"
ISSUES=(
"Crear estructura del repositorio y GitHub Project|Carpetas mínimas, plantillas y tablero con 5 columnas. Entregable: repo.|prioridad: alta,documentación"
"Completar README|Nombre del proyecto, integrantes, curso, espacio y descripción. Entregable: README.md|prioridad: alta,documentación"
"Sprint Planning|Reunión en Teams, captura y documento. Entregable: docs/sprint-planning.md|prioridad: alta,scrum"
"Preparar guía de visita y entrevista|Preguntas de observación y entrevista. Entregable: docs/guia-visita.md|prioridad: alta,documentación"
"Registrar evidencias fotográficas|Mínimo 10 fotos con descripción. Entregable: evidencias/fotografias/|prioridad: alta,evidencias"
"Registrar evidencias audiovisuales|Mínimo 1 video corto. Entregable: evidencias/videos/|prioridad: alta,evidencias"
"Redactar observaciones de campo|Respuestas a las 10 preguntas y entrevista. Entregable: problema/observaciones.md|prioridad: alta,problema"
"Identificar mínimo tres problemas|Tabla completa por problema con su evidencia. Entregable: problema/problemas-identificados.md|prioridad: alta,problema"
"Seleccionar y formular el problema|Sin mencionar tecnología, con actores y justificación. Entregable: problema/problema-seleccionado.md|prioridad: alta,problema"
"Redactar propuesta de solución|Qué, para quién, cómo funciona y tecnología. Entregable: propuesta/propuesta-solucion.md|prioridad: alta,propuesta"
"Documentar Daily Scrum|Mínimo 3 Dailys con captura. Entregable: docs/daily-scrum.md|prioridad: media,scrum"
"Sprint Review|Presentar avances y estado. Entregable: docs/sprint-review.md|prioridad: media,scrum"
"Sprint Retrospective|Qué hicimos bien, qué mejorar y acciones. Entregable: docs/sprint-retrospective.md|prioridad: media,scrum"
"Capturas de evidencias de GitHub|Project, issues, ramas, commits y PRs. Entregable: evidencias/evidencias-scrum/|prioridad: media,evidencias"
"Informe final|Consolidar todos los entregables. Entregable: informe/informe-final.md|prioridad: alta,documentación"
"Reflexiones individuales|Una por integrante. Entregable: informe/reflexiones/|prioridad: alta,documentación"
"Preparar presentación (10 min)|Diapositivas y ensayo. Entregable: presentacion/|prioridad: alta,documentación"
)

# ---------- Project ----------
PROJECT_NUM=$(gh project create --owner "$OWNER" --title "Laboratorio CLENA" --format json -q .number)
echo "Project #$PROJECT_NUM creado"
gh project link "$PROJECT_NUM" --owner "$OWNER" --repo "$OWNER/$REPO" || true
gh project field-create "$PROJECT_NUM" --owner "$OWNER" --name "Estado" \
  --data-type SINGLE_SELECT --single-select-options "Backlog,To Do,In Progress,Review,Done"
gh project field-create "$PROJECT_NUM" --owner "$OWNER" --name "Prioridad" \
  --data-type SINGLE_SELECT --single-select-options "Alta,Media,Baja"

for item in "${ISSUES[@]}"; do
  IFS='|' read -r TITLE BODY LABELS <<< "$item"
  URL=$(gh issue create --title "$TITLE" --body "$BODY" --label "$LABELS")
  gh project item-add "$PROJECT_NUM" --owner "$OWNER" --url "$URL" > /dev/null
  echo "  + $TITLE"
done

# ---------- Ramas ----------
for b in feature/observaciones feature/problemas-identificados feature/formulacion-problema \
         feature/propuesta-solucion docs/evidencias docs/scrum docs/informe-final docs/presentacion; do
  git push origin "main:refs/heads/$b" 2>/dev/null && echo "  rama $b" || echo "  (rama $b ya existe)"
done

cat <<EOF

Listo. Falta hacer a mano en GitHub (2 minutos):
  1. Abrir el Project → vista Board → "Group by: Estado" (así salen las 5 columnas).
  2. Mover todas las tarjetas a "Backlog" y las del sprint a "To Do".
  3. Asignar cada issue a su responsable (Assignees).
  4. Invitar a los integrantes como colaboradores del repo (Settings → Collaborators).
  5. Settings → Branches → proteger 'main' exigiendo Pull Request con 1 aprobación.
EOF
