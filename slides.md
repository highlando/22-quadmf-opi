---
author: 
 - Jan Heiland & P. Goyal & I. Pontes-Duff & P. Benner (MPI Magdeburg)
title: Identification of Models on Quadratic Manifolds
subtitle: <br><br><br><br> Eccomas 2022
title-slide-attributes:
    data-background-image: theme-pics/mpi-bridge.gif
parallaxBackgroundImage: theme-pics/csc-en.svg
parallaxBackgroundSize: 1000px 1200px
bibliography: quadmf-opinf.bib
nocite: |
  @*
---

# Nonlinear Model Order Reduction Schemes 

---

In most MOR schemes, the state of $x(t)
\in \mathbb R^{n}$ of a dynamical system
\begin{equation*}
\dot x(t) = f(x(t))
\end{equation*}
is **encoded** as
\begin{equation*}
q(t) = W^Tx(t)
\end{equation*}
and **decoded** via
\begin{equation*}
\tilde x(t) = Vq(t)
\end{equation*}
where $V$, $W\in \mathbb R^{n,k}$ are matrices.

---

Encoding and decoding
\begin{equation*}
q(t) = W^Tx(t), \quad \tilde x(t) = Vq(t) = W^TVx(t)
\end{equation*}
with $V$, $W\in \mathbb R^{n,k}$ is a **linear MOR** scheme as

 * $k \ll n$ -- reduction of the dimension and

 * $x(t)\approx \tilde x(t)=VW^Tq(t)$

## Linear MOR schemes

* fairly standard (*POD*, *Balanced Truncation*)
* fairly efficient (for linear systems or with hyperreduction like *DEIM*)
* inherently limited in terms of reduction versus accuracy (cp. *Kolmogorov $n$-width*)

. . .

* good evidence that at very low $k$, nonlinear encodings/decodings
\begin{equation*}
q(t) = h(x(t)), \quad \tilde x(t) = g(q(t))
\end{equation*}
provide better reduction vs. accuracy
* though not necessarily computational efficiency

## This talk

* Formulation of a MOR scheme with a linear quadratic encoding
\begin{equation*}
\tilde x(t) = Vq(t) + \Omega \, q(t) \otimes q(t)
\end{equation*}
* use of *Operator inference* to identify a dynamical system
\begin{equation*}
M(q(t))\,\dot q(t) = A_0 + A_1\, q(t) + A_2\,q(t) \otimes q(t)
\end{equation*}

* that best approximates given data on a $k$-dimensional manifold
* Numerical proof of concept for a laminar flow problem

# Quadratic Decoding

$$
x(t) \approx \tilde x(t) = Vq(t) + \Omega\,q(t)\otimes q(t)
$$

---

For a general nonlinear decoding
\begin{equation*}
x(t) \approx \tilde x(t) = g(q(t))
\end{equation*}
the dynamical system $\dot x(t) = f(x(t))$ is approximated and parametrized
\begin{equation*}
\dot {\tilde x(t)} = G(q(t)) \dot q(t) = f(g(q(t))
\end{equation*}
where 
\begin{equation*}
G(q(t)) = \nabla g(q(t)) \in \mathbb R^{n,k}
\end{equation*}
is the Jacobian of $g$ at $q(t)$.

---

With 
\begin{equation*}
g(q)=Vq + \Omega\,q\otimes q,
\end{equation*}
we have
\begin{equation*}
G(q)\bar q = V\bar q + \Omega\,q\otimes \bar q + \Omega\,\bar q\otimes q
\end{equation*}
and an approximation/parametrization of a linear system $\dot x(t) = Ax(t)$ as
\begin{equation*}
G(q)\dot q = A_1 q + A_2\, q\otimes q
\end{equation*}
with $A_1 = AV$ and $A_2 = A\Omega$.

---

Since for a manifold map $g\colon \mathbb R^{k}\to \mathbb R^{n}$, the Jacobian $$\nabla g(q(t)) =: G(q(t))$$ has full rank,

. . .

\begin{equation*}
G(q(t))^TG(q(t))\dot q(t) = G(q(t))^TA_1 q + G(q(t))^TA_2\, q\otimes q
\end{equation*}
gives a regular differential equation in $q$, which however comes with cubic parts
\begin{equation*}
M(q)\dot q(t) = \tilde A_1 q + \tilde A_2\, q\otimes q + \tilde A_3 q\otimes q \otimes q
\end{equation*}

# Operator Inference

Using data to infer a system with a quadratic decoding

---

We use a POD basis $V\in \mathbb R^{n,k}$ to encode a set of snapshots
\begin{equation*}
[v(t_1),\ v(t_2), \dots, v(t_N) ] \to [q(t_1),\ q(t_2), \dots, q(t_N) ]
\end{equation*}
by $$q(t_i) = Vv(t_i) \in \mathbb R^{k}$$

. . .

In a first step, we infer the quadratic correction $\Omega \in \mathbb R^{N,k^2}$ via 
\begin{equation*}
\sum_{i=1}^N \| v(t_i) - Vq(t_i) - \Omega \, q(t_i) \otimes q(t_i)\|^2 \to \min
\end{equation*}

---

Next, we *differentiate* the snapshots to compute
\begin{equation*}
\dot v(t_i) \to \dot q(t_i) = V\dot v(t_i)
\end{equation*}
and, with the Jacobian $G(q)$ of the decoding $q\to \tilde v$ at hand, we can form
the derivative along the manifold
\begin{equation*}
\dot {\tilde x}(t_i) = G(q(t_i))\dot q(t_i)
\end{equation*}

---

Finally we can solve the quadratic operator inference problem
\begin{equation*}
\sum_{i=1}^N \| M(q(t_i))\,\dot q(t_i) - A_0 + A_1\, q(t_i) - A_2\, q(t_i)\otimes q(t_i)\|^2 \to \min
\end{equation*}
that fits a quadratic system to the given snapshots.

# Numerical Example


## {data-background-image="pics/drivcav_stst_re500.png"}

. . .

::: {style="position: absolute; width: 60%; right: 0; box-shadow: 0 1px 4px rgba(0,0,0,0.5), 0 5px 25px rgba(0,0,0,0.2); background-color: rgba(0, 0, 0, 0.9); color: #fff; padding: 20px; font-size: 40px; text-align: left;"}
FEM Simulation of Navier-Stokes equations
$$
\dot v + (v\cdot \nabla) v- \frac{1}{\mathsf{Re}}\Delta v + \nabla p= f,
$$
$$
\nabla \cdot v = 0.
$$
:::

## {data-background-image="pics/drivcav_stst_re500.png"}

::: {style="position: absolute; width: 65%; right: 0; box-shadow: 0 1px 4px rgba(0,0,0,0.5), 0 5px 25px rgba(0,0,0,0.2); background-color: rgba(0, 0, 0, 0.9); color: #fff; padding: 20px; font-size: 40px; text-align: left;"}

 * 2D laminar lid driven cavity at `Re=500`
 * About 4000 `dof` in the FEM model
 * 400 snapshots on `[0, 4.8]` time interval
 * Reduced order model of size `r=5,8,12`
 * Extrapolation to the `[4.8, 6]` time interval
 * Comparison with `POD`, `DMDc`, `OpInf`
:::

## {data-background-image="pics/driven_cavity_time_domain_3042_rv5.png" data-background-size="80%"}

## {data-background-image="pics/driven_cavity_time_domain_3042_rv8.png" data-background-size="80%"}

## {data-background-image="pics/driven_cavity_time_domain_3042_rv12.png" data-background-size="80%"}

# Conclusion

## ... and Outlook

 * Quadratic decoding aligns well with operator inference

 * Tempting theory but no decisive numerical advantages observed

 * Possible ways for improvement
   * Regularization of the involved optimization problem
   * Inference of higher order terms

. . .

Thank You!

---

## References
