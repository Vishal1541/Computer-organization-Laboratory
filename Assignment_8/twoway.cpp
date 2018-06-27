#include <bits/stdc++.h>
#define ll long long int
using namespace std;

const ll MAX = 1<<15, M = 2e6, BLK_SIZE = 16, K = 2;
ll CM[MAX][2], counter[MAX][2], total_sets, cache_size, total_blks, cache_misses, total_addr = 1012176;
ll ADDRESS[M], address_input, power16[8], blk_no, set_no;
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

	// FIFO
	cout<<"FIFO Cache misses:\n";
	cache_size = 1<<10;
	for(int I=0; I<5; I++){
		total_blks = cache_size / BLK_SIZE;
		total_sets = total_blks / K;
		cache_misses = 0;
		for(int i=0; i<total_sets; i++)	CM[i][0] = CM[i][1] = counter[i][0] = counter[i][1] = -1;
		for(int i=0; i<total_addr; i++){
			address_input = ADDRESS[i];
			blk_no = address_input / BLK_SIZE;
			set_no = blk_no % total_sets;
			if(CM[set_no][0] == blk_no || CM[set_no][1] == blk_no)	continue;
			else if(counter[set_no][0] == -1)
				counter[set_no][0] = counter[set_no][1] + 1, CM[set_no][0] = blk_no, cache_misses++;
			else if(counter[set_no][1] == -1)
				counter[set_no][1] = counter[set_no][0] + 1, CM[set_no][1] = blk_no, cache_misses++;
			else{
				int idx;
				if(counter[set_no][0] < counter[set_no][1])	idx = 0;
				else 	idx = 1;
				swap(counter[set_no][0], counter[set_no][1]);
				CM[set_no][idx] = blk_no;
				cache_misses++;
			}	
		}
		cout<<cache_size<<": "<<cache_misses<<endl;
		cache_size <<= 1;
	}

	// LRU

	cout<<"LRU cache misses:\n";
	cache_size = 1024;
	for(int I=0; I<5; I++){
		total_blks = cache_size / BLK_SIZE;
		total_sets = total_blks / K;
		cache_misses = 0;
		for(int i=0; i<total_sets; i++)	CM[i][0] = CM[i][1] = counter[i][0] = counter[i][1] = -1;
		for(int i=0; i<total_addr; i++){
			address_input = ADDRESS[i];
			blk_no = address_input / 16;
			set_no = blk_no % total_sets;
			if(CM[set_no][0] == blk_no || CM[set_no][1] == blk_no){
				if((counter[set_no][0] == blk_no && counter[set_no][0] < counter[set_no][1])
					|| (counter[set_no][1] == blk_no && counter[set_no][0] > counter[set_no][1]))
				swap(counter[set_no][0], counter[set_no][1]);
				continue;
			}
			else if(counter[set_no][0] == -1)
				counter[set_no][0] = counter[set_no][1] + 1, CM[set_no][0] = blk_no, cache_misses++;
			else if(counter[set_no][1] == -1)
				counter[set_no][1] = counter[set_no][0] + 1, CM[set_no][1] = blk_no, cache_misses++;
			else{
				int idx;
				if(counter[set_no][0] < counter[set_no][1])	idx = 0;
				else 	idx = 1;
				swap(counter[set_no][0], counter[set_no][1]);
				CM[set_no][idx] = blk_no;
				cache_misses++;
			}	
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