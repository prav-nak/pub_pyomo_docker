There are many commercial as well as open source tools that help us translate an operations research business problem into mathematical formulation and solve it. In this repo, we use the open source package, Pyomo.

## [Pyomo](http://www.pyomo.org/about)
Pyomo is a Python-based open-source software package that supports a diverse set of optimization capabilities for formulating, solving, and analyzing optimization models. A core capability of Pyomo is modeling structured optimization applications.  Pyomo can be used to define general symbolic problems, create specific problem instances, and solve these instances using commercial and open-source solvers.  Pyomo's modeling objects are embedded within a full-featured high-level programming language providing a rich set of supporting libraries, which distinguishes Pyomo from other algebraic modeling languages like AMPL, AIMMS and GAMS. While Pyomo is a modeling language that assists in constructing a mathematical representation of the business problem, we need a highly performant solvers to solve these problems. We use GLPK (GNU Linear Programming Kit) for this purpose. 

## [GLPK]()
The GLPK (GNU Linear Programming Kit) package is intended for solving large-scale linear programming (LP), mixed integer programming (MIP), and other related problems. It is a set of routines written in ANSI C and organized in the form of a callable library. GLPK supports the GNU MathProg modeling language, which is a subset of the AMPL language.

The GLPK package includes the following main components:

* primal and dual simplex methods
* primal-dual interior-point method
* branch-and-cut method
* translator for GNU MathProg
* application program interface (API)
* stand-alone LP/MIP solver

## Containerized dev environment to solve OR problems
In this repo, we use docker to setup a linux development environment based on ubuntu, with the above mentioned optimization-related packages and anaconda python that will form the core image and based off of which we can spin up containers. We also add a 'sudoable' user so that extra packages/configuration be added if needed.

## How to use
Execute ```build.sh``` to generate the image and execute ```run_and_mount_volume.sh``` to run the container. 
This container also maps a host drive as a volume for persistent data storage. 

### Example
The example provided in ```Problem.py``` solves an academic warehouse location problem. The setup for the problem is provided in the ```Scenario.xlsx``` file. 


![Facility location](https://scipbook.readthedocs.io/en/latest/_images/flp.png)
*Left: graph representation of an instance of the facility location problem. Suppliers are represented as squares and clients as circles. Right: possible solution, with thick lines representing selected facilities and arcs actually used for transportation.*
