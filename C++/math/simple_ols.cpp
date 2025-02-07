#include <iostream>
#include <Eigen/Dense>

// on christ im still learning
// but this doesnt seem THAT horrible
// whatever, heres the most basic mathematical model
// in all of statistics

// simple ols model y=ax+bz+c
int main() {
       // define design matrix
       // kinda annoying to do it like this tbh
       // i need to figure out how to import data
       Eigen::MatrixXd X(3,3);
       X << 1,2,3,
            1,5,6,
            1,8,10;

       // define response vector
       Eigen::VectorXd y(3);
       y << 1,2,3;

       // solve(t(X)%*%X)%*%t(X)%*%y -> R equiv
       // B=((X`X)^-1)X`Y
       // actual ols model
       Eigen::MatrixXd result = (X.transpose()*X).inverse()*X.transpose()*y;

       // output results
       std::cout << "Design Mat:\n" << X << "\n\n";
       std::cout << "Response Vec:\n" << y << "\n\n";
       std::cout << "Results:\n" << result << "\n\n";
}
