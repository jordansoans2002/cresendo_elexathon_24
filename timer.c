#include <reg51.h>

sbit strt = P3^0;
sbit stp = P3^2;

sbit o1 = P1^0;
sbit o2 = P1^2;
sbit o3 = P2^7;
sbit o4 = P3^1;
sbit o5 = P2^6;

sbit r1 = P2^0;
sbit r2 = P2^1;
sbit r3 = P2^2;
sbit r4 = P2^3;
sbit r5 = P2^4;

void main(void);

void timer_loop(int n){
	int i;
	for(i=0;i<n*20;i++){
		TMOD = 0x01;
		TH0 = 0x4c;
		TL0 = 0x21;
		TR0 = 1;
		while(TF0==0){
			if(stp == 0)
				main();
		}
		TR0 = 0;
		TF0 = 0;
	}
}

void main(){
	P2 = P3 = P1 = 0x00;
	strt = stp = 1;
	while(1){
		if(strt == 0){
			strt = 1;
		
			timer_loop(10);
			o1 =1;
			r1 = 1;
			
			timer_loop(7);
			o2=1;
			r2=1;
			
			timer_loop(20);
			o3=1;
			r3=1;
			
			timer_loop(2);
			o4=1;
			r4=1;
			
			timer_loop(8);
			o5=1;
			r5=1;
		}
	}
}
			