# Average treatment effect (ATE) versus Averge Treatment Effect for the Treated (ATT)

**Causal Inference**
### Question: Does wellness program reduce health spending?
- For individual i, Wi: treated status:
	- Wi = 0: untreated
	- Wi = 1: treated
- Response variable Yi, two possible outcomes:
	- Yi(0) for Wi = 0
	- Yi(1) for Wi = 1
- In reality, we only observe one outcome, Yi(0) or Yi(1)
- Causal of Wi on Yi: Yi(1) - Yi(0)

### ATE versys ATT
- Average treatment effect (ATE)
	- ATE = E[Yi(1) - Yi(0)]
- Average treatment effect on the treated (ATT)
	- ATT = E[Yi(1) - Yi(0) | Wi = 1]
- E[Yi(1) | Wi = 1] - E[Yi(0) | Wi = 0] = E[Yi[1] | Wi = 1] - E[Yi[0] | Wi = 1] + E[Yi[0] | Wi = 1] - E[Yi[0] | Wi = 0] = ATT + selection_biase

