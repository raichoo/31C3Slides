#include <string>
template<bool C, typename T, typename F>
class If {};

template<typename T, typename F>
class If<true, T, F> {
public:
	typedef T Result;
};

template<typename T, typename F>
class If<false, T, F> {
public:
	typedef F Result;
};

int main(int argc, char **argv) {
	If<false,std::string,int>::Result x = 666;
	return 0;
}
