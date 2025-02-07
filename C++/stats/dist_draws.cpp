/////////////////////////////////////////////
///////////// 500 random draws //////////////
//// standard normal / normal / binomial ////
/////////////////////////////////////////////

#include <boost/random.hpp>
#include <boost/math/distributions.hpp>
#include <vector>
#include <fstream>
#include <iostream>

int main() {
    // reproducibility seed
    // never really learned about how these rng algorithms work
    // kinda cool ngl
    boost::random::mt19937 rng(360);

    // initialize the distributions
    // kinda lit cause i can set them as referencable variables
    boost::random::normal_distribution<> st_norm(0,1); // mean=0 sd=1
    boost::random::normal_distribution<> norm(2,9);    // mean=2 sd=9
    boost::random::binomial_distribution<> binom(1,0.5);  // size=1 p=0.3

    const int n_samples=500; // number of draws
    // initialize empty data structures to save values
    // afaik these necessary for temporary storage
    std::vector<double> st_norm_samp;
    std::vector<double> norm_samp;
    std::vector<int> binom_samp;

    // pull random draws
    for(int i = 0; i < n_samples; i++) {
        st_norm_samp.push_back(st_norm(rng));
        norm_samp.push_back(norm(rng));
        binom_samp.push_back(binom(rng));
    }

    // save output to .csv
    std::ofstream outFile("draws.csv");
    outFile << "draw,st_normal,normal,binomial\n";

    // access temporary storage vectors
    // to fill the .csv file
    for(int i = 0; i < n_samples; i++) {
        outFile << i + 1 << ","
                << st_norm_samp[i] << ","
                << norm_samp[i] << ","
                << binom_samp[i] << "\n";
    }

    // statement to let me know i didnt fuck it all up
    outFile.close();
    std::cout << "Successfully saved to draws.csv" << std::endl;

    return 0;
}
