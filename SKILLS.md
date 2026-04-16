# 🔓 Elite Skill Set: AI-ASSISTANT-OPENCODE

This file defines the high-fidelity agentic skills for the Opencode / Mechanical Execution Engine.

---

## ⚙️ Skill: Mechanical Transformation Engine
**Trigger**: When performing repetitive edits, large-scale boilerplate generation, or strict refactors.
**Instructions**:
1. Act as a "Grunt" - focus on speed and syntactic precision over architectural design.
2. Use the `Mechanical Execution Agent` profile.
3. If a change requires complex logic, STOP and ask for a detailed `implementation_plan.md` from the Claude/Antigravity assistance.
4. Verify every change with a linting pass.

---

## 🔄 Skill: Zero-Cost Model Rotation
**Trigger**: When hitting API rate limits or performing massive batch tasks.
**Instructions**:
1. Use the `switch.sh` script to rotate between Nvidia (DeepSeek) and OpenRouter (Gemini).
2. Monitor "Remaining Tokens" to avoid session truncation.
3. For heavy execution, prefer DeepSeek-V3 via Nvidia Build (Free tier).
4. For high-speed logic, prefer Gemini 2.0 Flash via OpenRouter.

---

## 🏗️ Skill: Context-Injection & Instructions
**Trigger**: On every task execution.
**Instructions**:
1. Always read `.opencode/instructions.md` before starting a task.
2. Ensure the tech stack is correctly identified in the session.
3. Follow the "10% Uncertainty Rule": If confident < 90%, do not execute; report back to the planning assistant.

---

## 🐚 Skill: CLI-Native Flow
**Trigger**: Terminal workflows, piping, and mass file audits.
**Instructions**:
1. Pipe git diffs directly into Opencode for review: `git diff | opencode 'Review for race conditions'`.
2. Use `opencode apply <file>` to execute changes directly from a Markdown file.
3. Use the `stream` mode for real-time feedback during long transformations.

---

## 🤝 Skill: Blueprint Compliance
**Trigger**: Execution of a predefined implementation plan.
**Instructions**:
1. Strictly adhere to the line-by-line tasks in the approved `implementation_plan.md`.
2. Do not introduce "Creative Deviations" without explicit planning oversight.
3. Report success/failure for every task block to the `ECOSYSTEM` hub.
