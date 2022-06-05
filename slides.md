---
author: 
 - Jan Heiland & P. Goyal & I. Pontes-Duff & P. Benner (MPI Magdeburg)
title: Identification of Models on Quadratic Manifolds
subtitle: <br><br><br><br> Eccomas 2022
title-slide-attributes:
    data-background-image: theme-pics/mpi-bridge.gif
parallaxBackgroundImage: theme-pics/csc-en.svg
parallaxBackgroundSize: 1000px 1200px
bibliography: nn-nse-ldlpv-talk.bib
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
* that best approximates given data on a $k$-dimensional manifold.
* Numerical proof of concept for a laminar flow problem.

# Quadratic Decoding

$$
x(t) \approx \tilde x(t) = Vq(t) + \Omega\,q(t)\otimes q(t)
$$

---

For a general nonlinear decoding
\begin{equation*}
x(t) \approx \tilde x(t) = g(q(t))
\end{equation*}
the dynamical system $\dot x(t) = f(x(t))$ is approximated and parametrized via $q$ as
\begin{equation*}
\dot {\tilde x(t)} = G(q(t)) \dot q(t) = f(g(q(t))
\end{equation*}
where 
\begin{equation*}
G(q(t)) = \nabla_q g(q(t)) \in \mathbb R^{n,k}
\end{equation*}
is the gradient of $g$ at $q(t)$.

---

With $g(q)=Vq + \Omega\,q\otimes q$, we have
\begin{equation*}
G(q)\bar q = V\bar q + \Omega\,q\otimes \bar q + \Omega\,\bar q\otimes q
\end{equation*}
and a approximation/parametrization of a linear system $\dot x(t) = Ax(t)$ as
\begin{equation*}
G(q)\dot q = A_1 q + A_2\, q\otimes q
\end{equation*}
with $A_1 = AV$ and $A_2 = A\Omega$.


# Numerical Realization and Example

**LPV Approximation** of *Navier-Stokes Equations* by *POD* and *Convolutional Neural Networks*

---


## {data-background-image="pics/cw-Re60-t161-cm-bbw.png" data-background-size="100%"}

```
data-background-size="100%"  # scales the background image with the window size
```

<br>
<br>
<br>

. . .

::: {style="position: absolute; width: 60%; right: 0; box-shadow: 0 1px 4px rgba(0,0,0,0.5), 0 5px 25px rgba(0,0,0,0.2); background-color: rgba(0, 0, 0, 0.9); color: #fff; padding: 20px; font-size: 40px; text-align: left;"}
The *Navier-Stokes* equations

$$
\dot v + (v\cdot \nabla) v- \frac{1}{\mathsf{Re}}\Delta v + \nabla p= f, 
$$

$$
\nabla \cdot v = 0.
$$

:::

---

![Velocity snapshot as inline picture](pics/cw-Re60-t161-cm-bbw.png)

\begin{align}
\dot v + (v\cdot \nabla) v- \frac{1}{\mathsf{Re}}\Delta v + \nabla p&= f, 
\nabla \cdot v &= 0.
\end{align}

::: {style="position: absolute; width: 60%; right: 0; box-shadow: 0 1px 4px rgba(0,0,0,0.5), 0 5px 25px rgba(0,0,0,0.2); background-color: rgba(0, 0, 0, 0.9); color: #fff; padding: 20px; font-size: 40px; text-align: left;"}
:::

# Conclusion

## ... and Outlook

 * Can also do citations like [@ApkGB95]

 * They go to the last slide


. . .

Thank You!

---

## References
