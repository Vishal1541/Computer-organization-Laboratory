#include <bits/stdc++.h>
#define ll long long int
using namespace std;

const ll MAX = 2e6, MAX_SIZE = 1<<15, BLK_SIZE = 16, total_addr = 1012176;
ll CM[MAX_SIZE], VALID_BIT[MAX_SIZE], cache_size, total_blks, cache_misses;
ll ADDRESS[MAX], address_input, power16[8], blk_no;
string s;

ll raiseToPow(ll x, ll y);

int main(){
	for(int i=0; i<8; i++)	power16[i] = raiseToPow(16,i);
	for(int i=0; i<total_addr; i++){
		cin>>s;
		address_input = 0;
		for(int j=0; j<8; j++)
			address_input += (s[j]>='0' && s[j]<='9'?
								(s[j]-'0'):(s[j]-'A')+10)*power16[7-j];
		ADDRESS[i] = address_input;
	}
	cout<<"Direct cache misses:\n";
	cache_size = 1024;
	for(int I=0; I<5; I++){
		total_blks = cache_size / BLK_SIZE;
		cache_misses = 0;
		for(int i=0; i<total_blks; i++)	VALID_BIT[i] = 0;
		for(int i=0; i<total_addr; i++){
			address_input = ADDRESS[i];
			blk_no = address_input / BLK_SIZE;
			if((VALID_BIT[blk_no%total_blks] && CM[blk_no%total_blks] != blk_no)
				|| !VALID_BIT[blk_no%total_blks])
				cache_misses++, VALID_BIT[blk_no%total_blks] = 1;
			CM[blk_no%total_blks] = blk_no;
		}
		cout<<cache_size<<": "<<cache_misses<<endl;
		cache_size <<= 1;
	}
	return 0;
}

ll raiseToPow(ll x, ll y){
    ll res = 1;  
    while (y > 0){
        if (y & 1)
            res = res*x;
        y /= 2;
        x = x*x;
    }
    return res;
}