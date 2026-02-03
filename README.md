# RLC Electrical System Modeling and PID Control (MATLAB & Simulink)

## 📖 Project Overview
This project focuses on the dynamic modeling, analysis, and control of a second-order RLC electrical system. The transfer function of the system is derived and analyzed using MATLAB. The system is also modeled using state-space representation in Simulink, and a PID controller is designed to improve transient and steady-state performance.

[Full Project Report](RLC_System_Project_Report.pdf)


---

## 🎯 Project Objectives

- Derive and analyze the transfer function of an RLC circuit
- Analyze system time-domain response
- Design a state-space model
- Verify controllability and observability of the system
- Design and implement a PID controller
- Improve system dynamic performance

---

## ⚙️ System Parameters

The circuit parameters used in this project:

| Parameter | Value |
|----------|---------|
| Resistance (R) | 9 Ω |
| Inductance (L) | 1 H |
| Capacitance (C) | 1 mF |

### Input Signal
Sinusoidal voltage input

### Output Signal
Capacitor voltage

---

## 📐 Transfer Function Analysis

The transfer function of the RLC system was derived using circuit analysis and Laplace transform techniques.
---
$$
H(s)=\frac{V_c(s)}{V_{in}(s)}=\frac{\frac{1}{LC}}{s^2+\frac{R}{L}s+\frac{1}{LC}}
$$

$$
R=9\Omega,\quad L=1H,\quad C=1mF
$$

$$
H(s)=\frac{1000}{s^2+9s+1000}
$$

---

### System Characteristics
- The system has **no zeros**
- Poles are complex conjugate and located in the left half plane
- The system is **stable**

Pole values: 
s = -4.5 ± 31.3i


### System Behavior
- Real part affects settling time
- Imaginary part determines oscillation frequency
- The system is underdamped

Damping ratio:
ζ = 0.1423

---

## 📊 Time Domain Analysis

System response was analyzed using impulse and step response simulations.

### Key Transient Response Parameters

| Parameter | Value |
|-----------|------------|
| Rise Time | 0.0252 s |
| Peak Time | 0.0702 s |
| Maximum Overshoot | 72.77 % |
| Settling Time | 0.8572 s |
| Steady-State Value | 1 |
| Maximum Output | 1.6366 |

MATLAB simulation results were validated using analytical calculations and final value theorem.

---

## 🧮 State-Space Modeling

The RLC system was converted into state-space representation and implemented in Simulink.

### State Variables
- Inductor current
- Capacitor voltage

### System Properties

Controllability matrix rank: 2  
Observability matrix rank: 2  

These results confirm that the system is fully controllable and observable.

---

## 🎛 PID Controller Design

A closed-loop control system was designed using a PID controller.

### PID Parameters

| Parameter | Value |
|------------|------------|
| Kp | 4.1293 |
| Ki | 54.5229 |
| Kd | 0.0782 |

The step input final value was set to 5 for controller evaluation.

---

## 📈 Performance Improvement with PID

### Comparison Results

| Parameter | Before PID | After PID |
|------------|----------------|--------------|
| Rise Time | 0.0252 s | 0.0155 s |
| Peak Time | 0.0702 s | 0.0323 s |
| Overshoot | 72.77 % | 9.85 % |
| Settling Time | 0.8572 s | 0.2115 s |
| Steady-State Error | 0.5 | 0 |

The PID controller significantly improved system stability and transient response.

---

## 🛠 Tools and Technologies Used

- MATLAB
- Simulink
- Control System Toolbox

---

## ▶️ How to Run the Project

1. Open MATLAB
2. Run MATLAB scripts for transfer function analysis
3. Open Simulink model
4. Run simulation and observe system response

---

## 📷 Simulation Results

(Add here)

- Step response without PID
- Step response with PID
- Simulink block diagram
- State-space model diagram

---

## 📄 Project Report

A detailed technical report is included in this repository.

---

## 🎓 Additional Training

The following MATLAB training modules were completed during this project:

- Simulink Onramp
- Simulink Fundamentals
- Control System Modeling Essentials
- Linearization of Nonlinear Systems

---

## 🚀 Future Work

- Hardware implementation
- Advanced control techniques (LQR, Adaptive Control)
- Real-time system simulation

---

## 👨‍💻 Author
Kerem Danışık  
Electrical and Electronics Engineering Student



