#define MILSPERCLOCK 32768

#define MASKHOUR1	0xF000
#define MASKHOUR0	0x0F00
#define MASKMIN1	0x00F0
#define MASKMIN0	0x000F

#define HOUR1	(*time & MASKHOUR1)
#define HOUR0	(*time & MASKHOUR0)
#define MIN1	(*time & MASKMIN1)
#define MIN0	(*time & MASKMIN0)

volatile int * houraddr = 770;
volatile int * pushaddr = 530;
int y;

void delay(int miliseconds)
{

	y = miliseconds;
	while (y--)
		;
}

void main()
{

	int *time = ((((int *)(houraddr + 3)) & 0x0003) << 12) | ((((int *)(houraddr + 2)) & 0x000F) << 8) | ((((int *)(houraddr + 1)) & 0x0007) << 4) | (((int *)houraddr) & 0x000F);
	int *push = (int *)pushaddr;
	int lastpush = 0;

	while (1)
	{
		lastpush = *push;

		if (lastpush == 1)
		{
			if (MIN0 == 9)
			{
				MIN0 = 0;
				MIN1 = MIN1 + 1;
			}
			else
			{
				MIN0 = MIN0 + 1;
			}
		}
		else if (lastpush == 2)
		{
			if (HOUR1 == 2)
			{
				if (HOUR0 == 3)
				{
					HOUR0 = 0;
					HOUR1 = 0;
				}
				else
				{
					HOUR0 = HOUR0 + 1;
				}
			}
			else
			{
				if (HOUR0 == 9)
				{
					HOUR0 = 0;
					HOUR1 = HOUR1 + 1;
				}
				else
				{
					HOUR0 = HOUR0 + 1;
				}
			}
		}
		delay(MILSPERCLOCK);
	}
	while (1){}

	return;
}
