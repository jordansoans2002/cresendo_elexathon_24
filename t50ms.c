#include <reg51.h>

int count=1;
sbit strt_btn = P3^0;
sbit stp_btn = P3^2;

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

sbit test = P3^7;

void reset(void){
	P2=0x00;
}

void task(o,r){
	//set o =1
	//set r = 1
}

void timer0_ISR(void) interrupt 1
{
	if(count == 200){
		//set p1.0,p2.0
		o1=0;
		r1=0;
	} else if(count == 340){
		//set p1.2,p2.1
		o2=0;
		r2=0;
	}else if(count == 600){
		//set p2.7,p2.2
		o3=0;
		r3=0;
	}else if(count == 640){
		//set p3.1,p2.3
		o4=0;
		r4=0;
	}else if(count == 800) {
		//set p2.6,p2.4
		o5=0;
		r5=0;
	}
	count++;
	TH0=0x4C;
	TL0=0x21;
}

void main(){
	//strt_btn=0;
	TMOD=0x01;//
	TH0=0x4C;// the higher half
	TL0=0x21;//the lower half 
	IE=0x82;//enablinginterrupt
	while(1){
		if(strt_btn == 0){
			strt_btn = 1;
			TR0 = 1;
		}
		if(stp_btn == 0 ){
			//TR = 0;
			reset();
		}
	}
}