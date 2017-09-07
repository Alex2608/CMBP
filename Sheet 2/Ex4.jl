#=
Hamiltonian
H = - Σ J_{ij}^α S_i^α S_J^α


a) Transform Hamiltonian

S_i^+ = S_i^x + iS_i^y
S_i^- = S_i^x - iS_i^y

Solve for S_x and S_y:
=> S_i^x = 0.5   (S_i^+ + S_i^-)
=> S_i^x = -0.5i (S_i^+ - S_i^-)

Insert in Hamiltonian
H = 0.25 J_{ij}^x (
        S_i^+ S_j^+ +
        S_i^+ S_j^- +
        S_i^- S_j^+ +
        S_i^- S_j^-   ) +
    0.25 H_{ij}^y (
        - S_i^+ S_j^+ +
        S_i^+ S_j^- +
        S_i^- S_j^+ +
        - S_i^- S_j^-   ) +
    J_{ij}^z S_i^z S_j^z

  = 0.25 (J_{ij}^x - J_{ij}^y) (S_i^+ S_j^+ + S_i^- S_j^-) +
    0.25 (J_{ij}^x + J_{ij}^y) (S_i^+ S_j^- + S_i^+ S_j^-) +
    J_{ij}^z S_i^z S_j^z


b) Ising Model

|0> = down
|1> = up

|111>, |110>, |101> |100>, ... |000>
 3   0   0   0   0   0   0   0
 0  -1   0   0   0   0   0   0
 0   0  -1   0   0   0   0   0
 0   0   0   1   0   0   0   0

 0   0   0   0  -1   0   0   0
 0   0   0   0   0   1   0   0
 0   0   0   0   0   0   1   0
 0   0   0   0   0   0   0  -3


c)
ordered numerically (|111> firs, |000> last)
 3   0   0   0   0   0   0   0
 0  -1   1   0   0   0   0   0
 0   1  -1   0   0   0   0   0
 0   0   0   1   0   0   1   0

 0   0   0   0  -1   0   1   0
 0   0   0   0   0   1   1   0
 0   0   0   1   1   1   1   0
 0   0   0   0   0   0   0  -3

=#
