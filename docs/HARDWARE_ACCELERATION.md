# Hardware Acceleration: The NIM Engine
## Technical Specification by Kazi Musharraf

Opencode represents the "Industrial Mechanical" layer of the Spectrum Ecosystem. To achieve zero-latency agentic execution, we leverage the **NVIDIA NIM** (NVIDIA Inference Microservices) stack.

---

## 🏛️ Architecture: TensorRT-LLM Integration

Opencode agents do not connect directly to raw LLM APIs. They communicate with an accelerated container layer that uses TensorRT-LLM to optimize weights for specific hardware.

### 1. The NIM Container Workflow
1. **Pull**: Acquire the optimized NIM image for your model (e.g., `llama-3.1-405b-instruct`).
2. **Execute**: The container uses continuous batching and PagedAttention to maximize throughput.
3. **Reason**: The agentic loop (Opencode) sends bulk file-diff requests to the container.

### 2. Quantization Profiles
To maximize VRAM efficiency on Kazi Musharraf's infrastructure, we use differentiated quantization:

| Profile | Quantization | Use Case |
| :--- | :--- | :--- |
| **Mechanical Prime** | FP8 | High-precision architectural refactors. |
| **Bulk Execution** | INT4 | Large-scale linting, documentation generation, and unit testing. |
| **Logic Burst** | FP16 | Critical security auditing and complex reasoning. |

---

## 🚀 OpenRouter: The Neural Link

When local hardware is at capacity, Opencode automatically fails over to the **OpenRouter Neural Link**.

### 1. Latency-Based Routing
The system monitors the tokens-per-second (TK/s) of every connected provider. If NVIDIA NIM local processing drops below 50 TK/s due to thermal throttling or queue depth, the link redirects to the fastest cloud provider (Groq or Together AI).

### 2. The Model Aggregator
Opencode treats models as "Resources".
- **Primary**: Llama 3.1 405B (Logical Authority)
- **Secondary**: DeepSeek V3 (Mechanical Efficiency)
- **Tertiary**: Mixtral 8x22B (Context Depth)

---

## 🛠️ Performance Benchmarks (2026.4)

*Measured on a Quad-H100 Node:*

- **Llama 3.1 70B**: 210 TP/s (Local NIM) vs 45 TP/s (Standard API).
- **DeepSeek V3**: 310 TP/s (OpenRouter Accelerated).
- **Context Capacity**: 128k Tokens supported with 100% retrieval accuracy via RAG-Injected NIM.

---
*Authored for the Spectrum Ecosystem | 2026.4*
