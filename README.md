# animal_task
All codes were made by @gregoryacacia

---
# Task aim
The aim of the task is to press the space bar when a frog appears on the screen. A captured frog will move towards its habitation, which depends on the condition that is chosen. 

---
# How to choose a condition and a modality
There are 3 different conditions: auditory, visual, audio-visual
Inside each of the conditions there is a lot of modalities about the characteristics of the frogs

## In the folder 'others'
- A_USV_a_nf_bm = the frogs have all a high croaking pitch, the frogs with few spots will move to the nenuphar and the frogs with a lot of spots to the logs
- B_USV_a_nm_bf = the frogs have all a high croaking pitch, the frogs with few spots will move to the logs and the frogs with a lot of spots to the nenuphar
- C_USV_g_nf_bm = the frogs have all a low croaking pitch, the frogs with few spots will move to the nenuphar and the frogs with a lot of spots to the logs
- D_USV_g_nm_bf = the frogs have all a low croaking pitch, the frogs with few spots will move to the logs and the frogs with a lot of spots to the nenuphar
- I_MSVA_nfa_bmg = the frogs with few spots and high croacking pitch will move to the nenuphar and the frogs with a lot of spots and low croaking pitch to the logs
- J_MSVA_nmg_bfa = the frogs with few spots and high croacking pitch will move to the logs and the frogs with a lot of spots and low croaking pitch to the nenuphar

## In the folder 'USA_m'
- E_USA_f_na_bg = the frogs have all few spots, the frogs with high croaking pitch will move to the nenuphar and the frogs with low croaking pitch to the logs
- F_USA_f_ng_ba = the frogs have all few spots, the frogs with high croaking pitch will move to the logs and the frogs with low croaking pitch to the nenuphar

## In the folder 'USA_f'
- G_USA_m_na_bg = the frogs have all many spots, the frogs with high croaking pitch will move to the nenuphar and the frogs with low croaking pitch to the logs
- H_USA_m_ng_ba = the frogs have all many spots, the frogs with high croaking pitch will move to the logs and the frogs with low croaking pitch to the nenuphar

---
# How to run a task
- Download the repository
- Open the folder others, USA_f or USA_m depending on which condition you want
- Open one code (for example: G_USA_m_na_bg)

## Load the package
- In the tab 'Home', select Set Path
- Select add with subfolders
- Select the folder Cogent2000v1.33

## Run the code
- In the command window, enter the following line (according to the chosen condition)
```matlab
G_USA_m_na_bg('participant name')
```
- Press tab to have the presentation of all animals
- Press tab to begin the task
