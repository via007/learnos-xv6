
_getChildrenTest：     文件格式 elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "types.h"
#include "stat.h"
#include "user.h"
int main(void)
{
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	pushl  -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	57                   	push   %edi
   e:	56                   	push   %esi
   f:	8d 75 a8             	lea    -0x58(%ebp),%esi
  12:	8d 7d e8             	lea    -0x18(%ebp),%edi
  15:	53                   	push   %ebx

    int runningProcessPID=getRunningProcessPID();//getRunningProcessPID is a system call which returns the PID of the running process .
  16:	89 f3                	mov    %esi,%ebx
{
  18:	51                   	push   %ecx
  19:	83 ec 58             	sub    $0x58,%esp
    int runningProcessPID=getRunningProcessPID();//getRunningProcessPID is a system call which returns the PID of the running process .
  1c:	e8 90 03 00 00       	call   3b1 <getRunningProcessPID>
  21:	89 45 a4             	mov    %eax,-0x5c(%ebp)

    int PIDs[16];
    for(int i=0;(i<16) && getRunningProcessPID()==runningProcessPID;++i)
  24:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  28:	e8 84 03 00 00       	call   3b1 <getRunningProcessPID>
  2d:	3b 45 a4             	cmp    -0x5c(%ebp),%eax
  30:	75 0f                	jne    41 <main+0x41>
    {
       PIDs[i]=fork();
  32:	e8 c2 02 00 00       	call   2f9 <fork>
  37:	83 c3 04             	add    $0x4,%ebx
  3a:	89 43 fc             	mov    %eax,-0x4(%ebx)
    for(int i=0;(i<16) && getRunningProcessPID()==runningProcessPID;++i)
  3d:	39 fb                	cmp    %edi,%ebx
  3f:	75 e7                	jne    28 <main+0x28>



    }

   if(getRunningProcessPID()==runningProcessPID)
  41:	e8 6b 03 00 00       	call   3b1 <getRunningProcessPID>
  46:	3b 45 a4             	cmp    -0x5c(%ebp),%eax
  49:	74 0e                	je     59 <main+0x59>





}
  4b:	8d 65 f0             	lea    -0x10(%ebp),%esp
  4e:	31 c0                	xor    %eax,%eax
  50:	59                   	pop    %ecx
  51:	5b                   	pop    %ebx
  52:	5e                   	pop    %esi
  53:	5f                   	pop    %edi
  54:	5d                   	pop    %ebp
  55:	8d 61 fc             	lea    -0x4(%ecx),%esp
  58:	c3                   	ret    
 printf(1,"===============================================================\nThe getChildren function result is:\n");
  59:	52                   	push   %edx
  5a:	52                   	push   %edx
  5b:	68 08 08 00 00       	push   $0x808
  60:	6a 01                	push   $0x1
  62:	e8 39 04 00 00       	call   4a0 <printf>
    getChildren();
  67:	e8 3d 03 00 00       	call   3a9 <getChildren>
     printf(1,"The main result is:\n");
  6c:	59                   	pop    %ecx
  6d:	5b                   	pop    %ebx
  6e:	68 b4 08 00 00       	push   $0x8b4
  73:	6a 01                	push   $0x1
  75:	e8 26 04 00 00       	call   4a0 <printf>
  7a:	83 c4 10             	add    $0x10,%esp
  7d:	8d 76 00             	lea    0x0(%esi),%esi
        printf(1,"%d\n",PIDs[i]);
  80:	83 ec 04             	sub    $0x4,%esp
  83:	ff 36                	pushl  (%esi)
  85:	83 c6 04             	add    $0x4,%esi
  88:	68 c9 08 00 00       	push   $0x8c9
  8d:	6a 01                	push   $0x1
  8f:	e8 0c 04 00 00       	call   4a0 <printf>
     for(int i=0;i<16;++i)
  94:	83 c4 10             	add    $0x10,%esp
  97:	39 fe                	cmp    %edi,%esi
  99:	75 e5                	jne    80 <main+0x80>
    printf(1,"===============================================================\n");
  9b:	50                   	push   %eax
  9c:	50                   	push   %eax
  9d:	68 70 08 00 00       	push   $0x870
  a2:	6a 01                	push   $0x1
  a4:	e8 f7 03 00 00       	call   4a0 <printf>
  a9:	83 c4 10             	add    $0x10,%esp
  ac:	eb 9d                	jmp    4b <main+0x4b>
  ae:	66 90                	xchg   %ax,%ax

000000b0 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
  b0:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  b1:	31 d2                	xor    %edx,%edx
{
  b3:	89 e5                	mov    %esp,%ebp
  b5:	53                   	push   %ebx
  b6:	8b 45 08             	mov    0x8(%ebp),%eax
  b9:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((*s++ = *t++) != 0)
  c0:	0f b6 0c 13          	movzbl (%ebx,%edx,1),%ecx
  c4:	88 0c 10             	mov    %cl,(%eax,%edx,1)
  c7:	83 c2 01             	add    $0x1,%edx
  ca:	84 c9                	test   %cl,%cl
  cc:	75 f2                	jne    c0 <strcpy+0x10>
    ;
  return os;
}
  ce:	5b                   	pop    %ebx
  cf:	5d                   	pop    %ebp
  d0:	c3                   	ret    
  d1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  d8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  df:	90                   	nop

000000e0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
  e0:	55                   	push   %ebp
  e1:	89 e5                	mov    %esp,%ebp
  e3:	56                   	push   %esi
  e4:	53                   	push   %ebx
  e5:	8b 5d 08             	mov    0x8(%ebp),%ebx
  e8:	8b 75 0c             	mov    0xc(%ebp),%esi
  while(*p && *p == *q)
  eb:	0f b6 13             	movzbl (%ebx),%edx
  ee:	0f b6 0e             	movzbl (%esi),%ecx
  f1:	84 d2                	test   %dl,%dl
  f3:	74 1e                	je     113 <strcmp+0x33>
  f5:	b8 01 00 00 00       	mov    $0x1,%eax
  fa:	38 ca                	cmp    %cl,%dl
  fc:	74 09                	je     107 <strcmp+0x27>
  fe:	eb 20                	jmp    120 <strcmp+0x40>
 100:	83 c0 01             	add    $0x1,%eax
 103:	38 ca                	cmp    %cl,%dl
 105:	75 19                	jne    120 <strcmp+0x40>
 107:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
 10b:	0f b6 0c 06          	movzbl (%esi,%eax,1),%ecx
 10f:	84 d2                	test   %dl,%dl
 111:	75 ed                	jne    100 <strcmp+0x20>
 113:	31 c0                	xor    %eax,%eax
    p++, q++;
  return (uchar)*p - (uchar)*q;
}
 115:	5b                   	pop    %ebx
 116:	5e                   	pop    %esi
  return (uchar)*p - (uchar)*q;
 117:	29 c8                	sub    %ecx,%eax
}
 119:	5d                   	pop    %ebp
 11a:	c3                   	ret    
 11b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 11f:	90                   	nop
 120:	0f b6 c2             	movzbl %dl,%eax
 123:	5b                   	pop    %ebx
 124:	5e                   	pop    %esi
  return (uchar)*p - (uchar)*q;
 125:	29 c8                	sub    %ecx,%eax
}
 127:	5d                   	pop    %ebp
 128:	c3                   	ret    
 129:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000130 <strlen>:

uint
strlen(const char *s)
{
 130:	55                   	push   %ebp
 131:	89 e5                	mov    %esp,%ebp
 133:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 136:	80 39 00             	cmpb   $0x0,(%ecx)
 139:	74 15                	je     150 <strlen+0x20>
 13b:	31 d2                	xor    %edx,%edx
 13d:	8d 76 00             	lea    0x0(%esi),%esi
 140:	83 c2 01             	add    $0x1,%edx
 143:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
 147:	89 d0                	mov    %edx,%eax
 149:	75 f5                	jne    140 <strlen+0x10>
    ;
  return n;
}
 14b:	5d                   	pop    %ebp
 14c:	c3                   	ret    
 14d:	8d 76 00             	lea    0x0(%esi),%esi
  for(n = 0; s[n]; n++)
 150:	31 c0                	xor    %eax,%eax
}
 152:	5d                   	pop    %ebp
 153:	c3                   	ret    
 154:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 15b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 15f:	90                   	nop

00000160 <memset>:

void*
memset(void *dst, int c, uint n)
{
 160:	55                   	push   %ebp
 161:	89 e5                	mov    %esp,%ebp
 163:	57                   	push   %edi
 164:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 167:	8b 4d 10             	mov    0x10(%ebp),%ecx
 16a:	8b 45 0c             	mov    0xc(%ebp),%eax
 16d:	89 d7                	mov    %edx,%edi
 16f:	fc                   	cld    
 170:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 172:	89 d0                	mov    %edx,%eax
 174:	5f                   	pop    %edi
 175:	5d                   	pop    %ebp
 176:	c3                   	ret    
 177:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 17e:	66 90                	xchg   %ax,%ax

00000180 <strchr>:

char*
strchr(const char *s, char c)
{
 180:	55                   	push   %ebp
 181:	89 e5                	mov    %esp,%ebp
 183:	53                   	push   %ebx
 184:	8b 45 08             	mov    0x8(%ebp),%eax
 187:	8b 55 0c             	mov    0xc(%ebp),%edx
  for(; *s; s++)
 18a:	0f b6 18             	movzbl (%eax),%ebx
 18d:	84 db                	test   %bl,%bl
 18f:	74 1d                	je     1ae <strchr+0x2e>
 191:	89 d1                	mov    %edx,%ecx
    if(*s == c)
 193:	38 d3                	cmp    %dl,%bl
 195:	75 0d                	jne    1a4 <strchr+0x24>
 197:	eb 17                	jmp    1b0 <strchr+0x30>
 199:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1a0:	38 ca                	cmp    %cl,%dl
 1a2:	74 0c                	je     1b0 <strchr+0x30>
  for(; *s; s++)
 1a4:	83 c0 01             	add    $0x1,%eax
 1a7:	0f b6 10             	movzbl (%eax),%edx
 1aa:	84 d2                	test   %dl,%dl
 1ac:	75 f2                	jne    1a0 <strchr+0x20>
      return (char*)s;
  return 0;
 1ae:	31 c0                	xor    %eax,%eax
}
 1b0:	5b                   	pop    %ebx
 1b1:	5d                   	pop    %ebp
 1b2:	c3                   	ret    
 1b3:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1ba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000001c0 <gets>:

char*
gets(char *buf, int max)
{
 1c0:	55                   	push   %ebp
 1c1:	89 e5                	mov    %esp,%ebp
 1c3:	57                   	push   %edi
 1c4:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 1c5:	31 f6                	xor    %esi,%esi
{
 1c7:	53                   	push   %ebx
 1c8:	89 f3                	mov    %esi,%ebx
 1ca:	83 ec 1c             	sub    $0x1c,%esp
 1cd:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i=0; i+1 < max; ){
 1d0:	eb 2f                	jmp    201 <gets+0x41>
 1d2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    cc = read(0, &c, 1);
 1d8:	83 ec 04             	sub    $0x4,%esp
 1db:	8d 45 e7             	lea    -0x19(%ebp),%eax
 1de:	6a 01                	push   $0x1
 1e0:	50                   	push   %eax
 1e1:	6a 00                	push   $0x0
 1e3:	e8 31 01 00 00       	call   319 <read>
    if(cc < 1)
 1e8:	83 c4 10             	add    $0x10,%esp
 1eb:	85 c0                	test   %eax,%eax
 1ed:	7e 1c                	jle    20b <gets+0x4b>
      break;
    buf[i++] = c;
 1ef:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 1f3:	83 c7 01             	add    $0x1,%edi
 1f6:	88 47 ff             	mov    %al,-0x1(%edi)
    if(c == '\n' || c == '\r')
 1f9:	3c 0a                	cmp    $0xa,%al
 1fb:	74 23                	je     220 <gets+0x60>
 1fd:	3c 0d                	cmp    $0xd,%al
 1ff:	74 1f                	je     220 <gets+0x60>
  for(i=0; i+1 < max; ){
 201:	83 c3 01             	add    $0x1,%ebx
 204:	89 fe                	mov    %edi,%esi
 206:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 209:	7c cd                	jl     1d8 <gets+0x18>
 20b:	89 f3                	mov    %esi,%ebx
      break;
  }
  buf[i] = '\0';
  return buf;
}
 20d:	8b 45 08             	mov    0x8(%ebp),%eax
  buf[i] = '\0';
 210:	c6 03 00             	movb   $0x0,(%ebx)
}
 213:	8d 65 f4             	lea    -0xc(%ebp),%esp
 216:	5b                   	pop    %ebx
 217:	5e                   	pop    %esi
 218:	5f                   	pop    %edi
 219:	5d                   	pop    %ebp
 21a:	c3                   	ret    
 21b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 21f:	90                   	nop
 220:	8b 75 08             	mov    0x8(%ebp),%esi
 223:	8b 45 08             	mov    0x8(%ebp),%eax
 226:	01 de                	add    %ebx,%esi
 228:	89 f3                	mov    %esi,%ebx
  buf[i] = '\0';
 22a:	c6 03 00             	movb   $0x0,(%ebx)
}
 22d:	8d 65 f4             	lea    -0xc(%ebp),%esp
 230:	5b                   	pop    %ebx
 231:	5e                   	pop    %esi
 232:	5f                   	pop    %edi
 233:	5d                   	pop    %ebp
 234:	c3                   	ret    
 235:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 23c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000240 <stat>:

int
stat(const char *n, struct stat *st)
{
 240:	55                   	push   %ebp
 241:	89 e5                	mov    %esp,%ebp
 243:	56                   	push   %esi
 244:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 245:	83 ec 08             	sub    $0x8,%esp
 248:	6a 00                	push   $0x0
 24a:	ff 75 08             	pushl  0x8(%ebp)
 24d:	e8 ef 00 00 00       	call   341 <open>
  if(fd < 0)
 252:	83 c4 10             	add    $0x10,%esp
 255:	85 c0                	test   %eax,%eax
 257:	78 27                	js     280 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 259:	83 ec 08             	sub    $0x8,%esp
 25c:	ff 75 0c             	pushl  0xc(%ebp)
 25f:	89 c3                	mov    %eax,%ebx
 261:	50                   	push   %eax
 262:	e8 f2 00 00 00       	call   359 <fstat>
  close(fd);
 267:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 26a:	89 c6                	mov    %eax,%esi
  close(fd);
 26c:	e8 b8 00 00 00       	call   329 <close>
  return r;
 271:	83 c4 10             	add    $0x10,%esp
}
 274:	8d 65 f8             	lea    -0x8(%ebp),%esp
 277:	89 f0                	mov    %esi,%eax
 279:	5b                   	pop    %ebx
 27a:	5e                   	pop    %esi
 27b:	5d                   	pop    %ebp
 27c:	c3                   	ret    
 27d:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 280:	be ff ff ff ff       	mov    $0xffffffff,%esi
 285:	eb ed                	jmp    274 <stat+0x34>
 287:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 28e:	66 90                	xchg   %ax,%ax

00000290 <atoi>:

int
atoi(const char *s)
{
 290:	55                   	push   %ebp
 291:	89 e5                	mov    %esp,%ebp
 293:	53                   	push   %ebx
 294:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 297:	0f be 11             	movsbl (%ecx),%edx
 29a:	8d 42 d0             	lea    -0x30(%edx),%eax
 29d:	3c 09                	cmp    $0x9,%al
  n = 0;
 29f:	b8 00 00 00 00       	mov    $0x0,%eax
  while('0' <= *s && *s <= '9')
 2a4:	77 1f                	ja     2c5 <atoi+0x35>
 2a6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 2ad:	8d 76 00             	lea    0x0(%esi),%esi
    n = n*10 + *s++ - '0';
 2b0:	83 c1 01             	add    $0x1,%ecx
 2b3:	8d 04 80             	lea    (%eax,%eax,4),%eax
 2b6:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
  while('0' <= *s && *s <= '9')
 2ba:	0f be 11             	movsbl (%ecx),%edx
 2bd:	8d 5a d0             	lea    -0x30(%edx),%ebx
 2c0:	80 fb 09             	cmp    $0x9,%bl
 2c3:	76 eb                	jbe    2b0 <atoi+0x20>
  return n;
}
 2c5:	5b                   	pop    %ebx
 2c6:	5d                   	pop    %ebp
 2c7:	c3                   	ret    
 2c8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 2cf:	90                   	nop

000002d0 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 2d0:	55                   	push   %ebp
 2d1:	89 e5                	mov    %esp,%ebp
 2d3:	57                   	push   %edi
 2d4:	8b 55 10             	mov    0x10(%ebp),%edx
 2d7:	8b 45 08             	mov    0x8(%ebp),%eax
 2da:	56                   	push   %esi
 2db:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 2de:	85 d2                	test   %edx,%edx
 2e0:	7e 13                	jle    2f5 <memmove+0x25>
 2e2:	01 c2                	add    %eax,%edx
  dst = vdst;
 2e4:	89 c7                	mov    %eax,%edi
 2e6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 2ed:	8d 76 00             	lea    0x0(%esi),%esi
    *dst++ = *src++;
 2f0:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 2f1:	39 fa                	cmp    %edi,%edx
 2f3:	75 fb                	jne    2f0 <memmove+0x20>
  return vdst;
}
 2f5:	5e                   	pop    %esi
 2f6:	5f                   	pop    %edi
 2f7:	5d                   	pop    %ebp
 2f8:	c3                   	ret    

000002f9 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 2f9:	b8 01 00 00 00       	mov    $0x1,%eax
 2fe:	cd 40                	int    $0x40
 300:	c3                   	ret    

00000301 <exit>:
SYSCALL(exit)
 301:	b8 02 00 00 00       	mov    $0x2,%eax
 306:	cd 40                	int    $0x40
 308:	c3                   	ret    

00000309 <wait>:
SYSCALL(wait)
 309:	b8 03 00 00 00       	mov    $0x3,%eax
 30e:	cd 40                	int    $0x40
 310:	c3                   	ret    

00000311 <pipe>:
SYSCALL(pipe)
 311:	b8 04 00 00 00       	mov    $0x4,%eax
 316:	cd 40                	int    $0x40
 318:	c3                   	ret    

00000319 <read>:
SYSCALL(read)
 319:	b8 05 00 00 00       	mov    $0x5,%eax
 31e:	cd 40                	int    $0x40
 320:	c3                   	ret    

00000321 <write>:
SYSCALL(write)
 321:	b8 10 00 00 00       	mov    $0x10,%eax
 326:	cd 40                	int    $0x40
 328:	c3                   	ret    

00000329 <close>:
SYSCALL(close)
 329:	b8 15 00 00 00       	mov    $0x15,%eax
 32e:	cd 40                	int    $0x40
 330:	c3                   	ret    

00000331 <kill>:
SYSCALL(kill)
 331:	b8 06 00 00 00       	mov    $0x6,%eax
 336:	cd 40                	int    $0x40
 338:	c3                   	ret    

00000339 <exec>:
SYSCALL(exec)
 339:	b8 07 00 00 00       	mov    $0x7,%eax
 33e:	cd 40                	int    $0x40
 340:	c3                   	ret    

00000341 <open>:
SYSCALL(open)
 341:	b8 0f 00 00 00       	mov    $0xf,%eax
 346:	cd 40                	int    $0x40
 348:	c3                   	ret    

00000349 <mknod>:
SYSCALL(mknod)
 349:	b8 11 00 00 00       	mov    $0x11,%eax
 34e:	cd 40                	int    $0x40
 350:	c3                   	ret    

00000351 <unlink>:
SYSCALL(unlink)
 351:	b8 12 00 00 00       	mov    $0x12,%eax
 356:	cd 40                	int    $0x40
 358:	c3                   	ret    

00000359 <fstat>:
SYSCALL(fstat)
 359:	b8 08 00 00 00       	mov    $0x8,%eax
 35e:	cd 40                	int    $0x40
 360:	c3                   	ret    

00000361 <link>:
SYSCALL(link)
 361:	b8 13 00 00 00       	mov    $0x13,%eax
 366:	cd 40                	int    $0x40
 368:	c3                   	ret    

00000369 <mkdir>:
SYSCALL(mkdir)
 369:	b8 14 00 00 00       	mov    $0x14,%eax
 36e:	cd 40                	int    $0x40
 370:	c3                   	ret    

00000371 <chdir>:
SYSCALL(chdir)
 371:	b8 09 00 00 00       	mov    $0x9,%eax
 376:	cd 40                	int    $0x40
 378:	c3                   	ret    

00000379 <dup>:
SYSCALL(dup)
 379:	b8 0a 00 00 00       	mov    $0xa,%eax
 37e:	cd 40                	int    $0x40
 380:	c3                   	ret    

00000381 <getpid>:
SYSCALL(getpid)
 381:	b8 0b 00 00 00       	mov    $0xb,%eax
 386:	cd 40                	int    $0x40
 388:	c3                   	ret    

00000389 <sbrk>:
SYSCALL(sbrk)
 389:	b8 0c 00 00 00       	mov    $0xc,%eax
 38e:	cd 40                	int    $0x40
 390:	c3                   	ret    

00000391 <sleep>:
SYSCALL(sleep)
 391:	b8 0d 00 00 00       	mov    $0xd,%eax
 396:	cd 40                	int    $0x40
 398:	c3                   	ret    

00000399 <uptime>:
SYSCALL(uptime)
 399:	b8 0e 00 00 00       	mov    $0xe,%eax
 39e:	cd 40                	int    $0x40
 3a0:	c3                   	ret    

000003a1 <printingMyFavoriteYear>:
SYSCALL(printingMyFavoriteYear)
 3a1:	b8 16 00 00 00       	mov    $0x16,%eax
 3a6:	cd 40                	int    $0x40
 3a8:	c3                   	ret    

000003a9 <getChildren>:
SYSCALL(getChildren)
 3a9:	b8 17 00 00 00       	mov    $0x17,%eax
 3ae:	cd 40                	int    $0x40
 3b0:	c3                   	ret    

000003b1 <getRunningProcessPID>:
SYSCALL(getRunningProcessPID)
 3b1:	b8 18 00 00 00       	mov    $0x18,%eax
 3b6:	cd 40                	int    $0x40
 3b8:	c3                   	ret    

000003b9 <changePolicy>:
SYSCALL(changePolicy)
 3b9:	b8 19 00 00 00       	mov    $0x19,%eax
 3be:	cd 40                	int    $0x40
 3c0:	c3                   	ret    

000003c1 <Quantum_Increaser>:
SYSCALL(Quantum_Increaser)
 3c1:	b8 1a 00 00 00       	mov    $0x1a,%eax
 3c6:	cd 40                	int    $0x40
 3c8:	c3                   	ret    

000003c9 <Quantum_Decreaser>:
SYSCALL(Quantum_Decreaser)
 3c9:	b8 1b 00 00 00       	mov    $0x1b,%eax
 3ce:	cd 40                	int    $0x40
 3d0:	c3                   	ret    
 3d1:	66 90                	xchg   %ax,%ax
 3d3:	66 90                	xchg   %ax,%ax
 3d5:	66 90                	xchg   %ax,%ax
 3d7:	66 90                	xchg   %ax,%ax
 3d9:	66 90                	xchg   %ax,%ax
 3db:	66 90                	xchg   %ax,%ax
 3dd:	66 90                	xchg   %ax,%ax
 3df:	90                   	nop

000003e0 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 3e0:	55                   	push   %ebp
 3e1:	89 e5                	mov    %esp,%ebp
 3e3:	57                   	push   %edi
 3e4:	56                   	push   %esi
 3e5:	53                   	push   %ebx
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 3e6:	89 d3                	mov    %edx,%ebx
{
 3e8:	83 ec 3c             	sub    $0x3c,%esp
 3eb:	89 45 bc             	mov    %eax,-0x44(%ebp)
  if(sgn && xx < 0){
 3ee:	85 d2                	test   %edx,%edx
 3f0:	0f 89 92 00 00 00    	jns    488 <printint+0xa8>
 3f6:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 3fa:	0f 84 88 00 00 00    	je     488 <printint+0xa8>
    neg = 1;
 400:	c7 45 c0 01 00 00 00 	movl   $0x1,-0x40(%ebp)
    x = -xx;
 407:	f7 db                	neg    %ebx
  } else {
    x = xx;
  }

  i = 0;
 409:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
 410:	8d 75 d7             	lea    -0x29(%ebp),%esi
 413:	eb 08                	jmp    41d <printint+0x3d>
 415:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 418:	89 7d c4             	mov    %edi,-0x3c(%ebp)
  }while((x /= base) != 0);
 41b:	89 c3                	mov    %eax,%ebx
    buf[i++] = digits[x % base];
 41d:	89 d8                	mov    %ebx,%eax
 41f:	31 d2                	xor    %edx,%edx
 421:	8b 7d c4             	mov    -0x3c(%ebp),%edi
 424:	f7 f1                	div    %ecx
 426:	83 c7 01             	add    $0x1,%edi
 429:	0f b6 92 d4 08 00 00 	movzbl 0x8d4(%edx),%edx
 430:	88 14 3e             	mov    %dl,(%esi,%edi,1)
  }while((x /= base) != 0);
 433:	39 d9                	cmp    %ebx,%ecx
 435:	76 e1                	jbe    418 <printint+0x38>
  if(neg)
 437:	8b 45 c0             	mov    -0x40(%ebp),%eax
 43a:	85 c0                	test   %eax,%eax
 43c:	74 0d                	je     44b <printint+0x6b>
    buf[i++] = '-';
 43e:	c6 44 3d d8 2d       	movb   $0x2d,-0x28(%ebp,%edi,1)
 443:	ba 2d 00 00 00       	mov    $0x2d,%edx
    buf[i++] = digits[x % base];
 448:	89 7d c4             	mov    %edi,-0x3c(%ebp)
 44b:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 44e:	8b 7d bc             	mov    -0x44(%ebp),%edi
 451:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
 455:	eb 0f                	jmp    466 <printint+0x86>
 457:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 45e:	66 90                	xchg   %ax,%ax
 460:	0f b6 13             	movzbl (%ebx),%edx
 463:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
 466:	83 ec 04             	sub    $0x4,%esp
 469:	88 55 d7             	mov    %dl,-0x29(%ebp)
 46c:	6a 01                	push   $0x1
 46e:	56                   	push   %esi
 46f:	57                   	push   %edi
 470:	e8 ac fe ff ff       	call   321 <write>

  while(--i >= 0)
 475:	83 c4 10             	add    $0x10,%esp
 478:	39 de                	cmp    %ebx,%esi
 47a:	75 e4                	jne    460 <printint+0x80>
    putc(fd, buf[i]);
}
 47c:	8d 65 f4             	lea    -0xc(%ebp),%esp
 47f:	5b                   	pop    %ebx
 480:	5e                   	pop    %esi
 481:	5f                   	pop    %edi
 482:	5d                   	pop    %ebp
 483:	c3                   	ret    
 484:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 488:	c7 45 c0 00 00 00 00 	movl   $0x0,-0x40(%ebp)
 48f:	e9 75 ff ff ff       	jmp    409 <printint+0x29>
 494:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 49b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 49f:	90                   	nop

000004a0 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 4a0:	55                   	push   %ebp
 4a1:	89 e5                	mov    %esp,%ebp
 4a3:	57                   	push   %edi
 4a4:	56                   	push   %esi
 4a5:	53                   	push   %ebx
 4a6:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 4a9:	8b 75 0c             	mov    0xc(%ebp),%esi
 4ac:	0f b6 1e             	movzbl (%esi),%ebx
 4af:	84 db                	test   %bl,%bl
 4b1:	0f 84 b9 00 00 00    	je     570 <printf+0xd0>
  ap = (uint*)(void*)&fmt + 1;
 4b7:	8d 45 10             	lea    0x10(%ebp),%eax
 4ba:	83 c6 01             	add    $0x1,%esi
  write(fd, &c, 1);
 4bd:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
 4c0:	31 d2                	xor    %edx,%edx
  ap = (uint*)(void*)&fmt + 1;
 4c2:	89 45 d0             	mov    %eax,-0x30(%ebp)
 4c5:	eb 38                	jmp    4ff <printf+0x5f>
 4c7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 4ce:	66 90                	xchg   %ax,%ax
 4d0:	89 55 d4             	mov    %edx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 4d3:	ba 25 00 00 00       	mov    $0x25,%edx
      if(c == '%'){
 4d8:	83 f8 25             	cmp    $0x25,%eax
 4db:	74 17                	je     4f4 <printf+0x54>
  write(fd, &c, 1);
 4dd:	83 ec 04             	sub    $0x4,%esp
 4e0:	88 5d e7             	mov    %bl,-0x19(%ebp)
 4e3:	6a 01                	push   $0x1
 4e5:	57                   	push   %edi
 4e6:	ff 75 08             	pushl  0x8(%ebp)
 4e9:	e8 33 fe ff ff       	call   321 <write>
 4ee:	8b 55 d4             	mov    -0x2c(%ebp),%edx
      } else {
        putc(fd, c);
 4f1:	83 c4 10             	add    $0x10,%esp
 4f4:	83 c6 01             	add    $0x1,%esi
  for(i = 0; fmt[i]; i++){
 4f7:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
 4fb:	84 db                	test   %bl,%bl
 4fd:	74 71                	je     570 <printf+0xd0>
    c = fmt[i] & 0xff;
 4ff:	0f be cb             	movsbl %bl,%ecx
 502:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
 505:	85 d2                	test   %edx,%edx
 507:	74 c7                	je     4d0 <printf+0x30>
      }
    } else if(state == '%'){
 509:	83 fa 25             	cmp    $0x25,%edx
 50c:	75 e6                	jne    4f4 <printf+0x54>
      if(c == 'd'){
 50e:	83 f8 64             	cmp    $0x64,%eax
 511:	0f 84 99 00 00 00    	je     5b0 <printf+0x110>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 517:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
 51d:	83 f9 70             	cmp    $0x70,%ecx
 520:	74 5e                	je     580 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 522:	83 f8 73             	cmp    $0x73,%eax
 525:	0f 84 d5 00 00 00    	je     600 <printf+0x160>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 52b:	83 f8 63             	cmp    $0x63,%eax
 52e:	0f 84 8c 00 00 00    	je     5c0 <printf+0x120>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 534:	83 f8 25             	cmp    $0x25,%eax
 537:	0f 84 b3 00 00 00    	je     5f0 <printf+0x150>
  write(fd, &c, 1);
 53d:	83 ec 04             	sub    $0x4,%esp
 540:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 544:	6a 01                	push   $0x1
 546:	57                   	push   %edi
 547:	ff 75 08             	pushl  0x8(%ebp)
 54a:	e8 d2 fd ff ff       	call   321 <write>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
 54f:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
 552:	83 c4 0c             	add    $0xc,%esp
 555:	6a 01                	push   $0x1
 557:	83 c6 01             	add    $0x1,%esi
 55a:	57                   	push   %edi
 55b:	ff 75 08             	pushl  0x8(%ebp)
 55e:	e8 be fd ff ff       	call   321 <write>
  for(i = 0; fmt[i]; i++){
 563:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
        putc(fd, c);
 567:	83 c4 10             	add    $0x10,%esp
      }
      state = 0;
 56a:	31 d2                	xor    %edx,%edx
  for(i = 0; fmt[i]; i++){
 56c:	84 db                	test   %bl,%bl
 56e:	75 8f                	jne    4ff <printf+0x5f>
    }
  }
}
 570:	8d 65 f4             	lea    -0xc(%ebp),%esp
 573:	5b                   	pop    %ebx
 574:	5e                   	pop    %esi
 575:	5f                   	pop    %edi
 576:	5d                   	pop    %ebp
 577:	c3                   	ret    
 578:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 57f:	90                   	nop
        printint(fd, *ap, 16, 0);
 580:	83 ec 0c             	sub    $0xc,%esp
 583:	b9 10 00 00 00       	mov    $0x10,%ecx
 588:	6a 00                	push   $0x0
 58a:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 58d:	8b 45 08             	mov    0x8(%ebp),%eax
 590:	8b 13                	mov    (%ebx),%edx
 592:	e8 49 fe ff ff       	call   3e0 <printint>
        ap++;
 597:	89 d8                	mov    %ebx,%eax
 599:	83 c4 10             	add    $0x10,%esp
      state = 0;
 59c:	31 d2                	xor    %edx,%edx
        ap++;
 59e:	83 c0 04             	add    $0x4,%eax
 5a1:	89 45 d0             	mov    %eax,-0x30(%ebp)
 5a4:	e9 4b ff ff ff       	jmp    4f4 <printf+0x54>
 5a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        printint(fd, *ap, 10, 1);
 5b0:	83 ec 0c             	sub    $0xc,%esp
 5b3:	b9 0a 00 00 00       	mov    $0xa,%ecx
 5b8:	6a 01                	push   $0x1
 5ba:	eb ce                	jmp    58a <printf+0xea>
 5bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        putc(fd, *ap);
 5c0:	8b 5d d0             	mov    -0x30(%ebp),%ebx
  write(fd, &c, 1);
 5c3:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
 5c6:	8b 03                	mov    (%ebx),%eax
  write(fd, &c, 1);
 5c8:	6a 01                	push   $0x1
        ap++;
 5ca:	83 c3 04             	add    $0x4,%ebx
  write(fd, &c, 1);
 5cd:	57                   	push   %edi
 5ce:	ff 75 08             	pushl  0x8(%ebp)
        putc(fd, *ap);
 5d1:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 5d4:	e8 48 fd ff ff       	call   321 <write>
        ap++;
 5d9:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 5dc:	83 c4 10             	add    $0x10,%esp
      state = 0;
 5df:	31 d2                	xor    %edx,%edx
 5e1:	e9 0e ff ff ff       	jmp    4f4 <printf+0x54>
 5e6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 5ed:	8d 76 00             	lea    0x0(%esi),%esi
        putc(fd, c);
 5f0:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
 5f3:	83 ec 04             	sub    $0x4,%esp
 5f6:	e9 5a ff ff ff       	jmp    555 <printf+0xb5>
 5fb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 5ff:	90                   	nop
        s = (char*)*ap;
 600:	8b 45 d0             	mov    -0x30(%ebp),%eax
 603:	8b 18                	mov    (%eax),%ebx
        ap++;
 605:	83 c0 04             	add    $0x4,%eax
 608:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 60b:	85 db                	test   %ebx,%ebx
 60d:	74 17                	je     626 <printf+0x186>
        while(*s != 0){
 60f:	0f b6 03             	movzbl (%ebx),%eax
      state = 0;
 612:	31 d2                	xor    %edx,%edx
        while(*s != 0){
 614:	84 c0                	test   %al,%al
 616:	0f 84 d8 fe ff ff    	je     4f4 <printf+0x54>
 61c:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 61f:	89 de                	mov    %ebx,%esi
 621:	8b 5d 08             	mov    0x8(%ebp),%ebx
 624:	eb 1a                	jmp    640 <printf+0x1a0>
          s = "(null)";
 626:	bb cd 08 00 00       	mov    $0x8cd,%ebx
        while(*s != 0){
 62b:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 62e:	b8 28 00 00 00       	mov    $0x28,%eax
 633:	89 de                	mov    %ebx,%esi
 635:	8b 5d 08             	mov    0x8(%ebp),%ebx
 638:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 63f:	90                   	nop
  write(fd, &c, 1);
 640:	83 ec 04             	sub    $0x4,%esp
          s++;
 643:	83 c6 01             	add    $0x1,%esi
 646:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 649:	6a 01                	push   $0x1
 64b:	57                   	push   %edi
 64c:	53                   	push   %ebx
 64d:	e8 cf fc ff ff       	call   321 <write>
        while(*s != 0){
 652:	0f b6 06             	movzbl (%esi),%eax
 655:	83 c4 10             	add    $0x10,%esp
 658:	84 c0                	test   %al,%al
 65a:	75 e4                	jne    640 <printf+0x1a0>
 65c:	8b 75 d4             	mov    -0x2c(%ebp),%esi
      state = 0;
 65f:	31 d2                	xor    %edx,%edx
 661:	e9 8e fe ff ff       	jmp    4f4 <printf+0x54>
 666:	66 90                	xchg   %ax,%ax
 668:	66 90                	xchg   %ax,%ax
 66a:	66 90                	xchg   %ax,%ax
 66c:	66 90                	xchg   %ax,%ax
 66e:	66 90                	xchg   %ax,%ax

00000670 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 670:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 671:	a1 a0 0b 00 00       	mov    0xba0,%eax
{
 676:	89 e5                	mov    %esp,%ebp
 678:	57                   	push   %edi
 679:	56                   	push   %esi
 67a:	53                   	push   %ebx
 67b:	8b 5d 08             	mov    0x8(%ebp),%ebx
 67e:	8b 10                	mov    (%eax),%edx
  bp = (Header*)ap - 1;
 680:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 683:	39 c8                	cmp    %ecx,%eax
 685:	73 19                	jae    6a0 <free+0x30>
 687:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 68e:	66 90                	xchg   %ax,%ax
 690:	39 d1                	cmp    %edx,%ecx
 692:	72 14                	jb     6a8 <free+0x38>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 694:	39 d0                	cmp    %edx,%eax
 696:	73 10                	jae    6a8 <free+0x38>
{
 698:	89 d0                	mov    %edx,%eax
 69a:	8b 10                	mov    (%eax),%edx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 69c:	39 c8                	cmp    %ecx,%eax
 69e:	72 f0                	jb     690 <free+0x20>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 6a0:	39 d0                	cmp    %edx,%eax
 6a2:	72 f4                	jb     698 <free+0x28>
 6a4:	39 d1                	cmp    %edx,%ecx
 6a6:	73 f0                	jae    698 <free+0x28>
      break;
  if(bp + bp->s.size == p->s.ptr){
 6a8:	8b 73 fc             	mov    -0x4(%ebx),%esi
 6ab:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 6ae:	39 fa                	cmp    %edi,%edx
 6b0:	74 1e                	je     6d0 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 6b2:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 6b5:	8b 50 04             	mov    0x4(%eax),%edx
 6b8:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 6bb:	39 f1                	cmp    %esi,%ecx
 6bd:	74 28                	je     6e7 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 6bf:	89 08                	mov    %ecx,(%eax)
  freep = p;
}
 6c1:	5b                   	pop    %ebx
  freep = p;
 6c2:	a3 a0 0b 00 00       	mov    %eax,0xba0
}
 6c7:	5e                   	pop    %esi
 6c8:	5f                   	pop    %edi
 6c9:	5d                   	pop    %ebp
 6ca:	c3                   	ret    
 6cb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 6cf:	90                   	nop
    bp->s.size += p->s.ptr->s.size;
 6d0:	03 72 04             	add    0x4(%edx),%esi
 6d3:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 6d6:	8b 10                	mov    (%eax),%edx
 6d8:	8b 12                	mov    (%edx),%edx
 6da:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 6dd:	8b 50 04             	mov    0x4(%eax),%edx
 6e0:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 6e3:	39 f1                	cmp    %esi,%ecx
 6e5:	75 d8                	jne    6bf <free+0x4f>
    p->s.size += bp->s.size;
 6e7:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
 6ea:	a3 a0 0b 00 00       	mov    %eax,0xba0
    p->s.size += bp->s.size;
 6ef:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 6f2:	8b 53 f8             	mov    -0x8(%ebx),%edx
 6f5:	89 10                	mov    %edx,(%eax)
}
 6f7:	5b                   	pop    %ebx
 6f8:	5e                   	pop    %esi
 6f9:	5f                   	pop    %edi
 6fa:	5d                   	pop    %ebp
 6fb:	c3                   	ret    
 6fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000700 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 700:	55                   	push   %ebp
 701:	89 e5                	mov    %esp,%ebp
 703:	57                   	push   %edi
 704:	56                   	push   %esi
 705:	53                   	push   %ebx
 706:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 709:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 70c:	8b 3d a0 0b 00 00    	mov    0xba0,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 712:	8d 70 07             	lea    0x7(%eax),%esi
 715:	c1 ee 03             	shr    $0x3,%esi
 718:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
 71b:	85 ff                	test   %edi,%edi
 71d:	0f 84 ad 00 00 00    	je     7d0 <malloc+0xd0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 723:	8b 17                	mov    (%edi),%edx
    if(p->s.size >= nunits){
 725:	8b 4a 04             	mov    0x4(%edx),%ecx
 728:	39 f1                	cmp    %esi,%ecx
 72a:	73 72                	jae    79e <malloc+0x9e>
 72c:	81 fe 00 10 00 00    	cmp    $0x1000,%esi
 732:	bb 00 10 00 00       	mov    $0x1000,%ebx
 737:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
 73a:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 741:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 744:	eb 1b                	jmp    761 <malloc+0x61>
 746:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 74d:	8d 76 00             	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 750:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 752:	8b 48 04             	mov    0x4(%eax),%ecx
 755:	39 f1                	cmp    %esi,%ecx
 757:	73 4f                	jae    7a8 <malloc+0xa8>
 759:	8b 3d a0 0b 00 00    	mov    0xba0,%edi
 75f:	89 c2                	mov    %eax,%edx
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 761:	39 d7                	cmp    %edx,%edi
 763:	75 eb                	jne    750 <malloc+0x50>
  p = sbrk(nu * sizeof(Header));
 765:	83 ec 0c             	sub    $0xc,%esp
 768:	ff 75 e4             	pushl  -0x1c(%ebp)
 76b:	e8 19 fc ff ff       	call   389 <sbrk>
  if(p == (char*)-1)
 770:	83 c4 10             	add    $0x10,%esp
 773:	83 f8 ff             	cmp    $0xffffffff,%eax
 776:	74 1c                	je     794 <malloc+0x94>
  hp->s.size = nu;
 778:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 77b:	83 ec 0c             	sub    $0xc,%esp
 77e:	83 c0 08             	add    $0x8,%eax
 781:	50                   	push   %eax
 782:	e8 e9 fe ff ff       	call   670 <free>
  return freep;
 787:	8b 15 a0 0b 00 00    	mov    0xba0,%edx
      if((p = morecore(nunits)) == 0)
 78d:	83 c4 10             	add    $0x10,%esp
 790:	85 d2                	test   %edx,%edx
 792:	75 bc                	jne    750 <malloc+0x50>
        return 0;
  }
}
 794:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 797:	31 c0                	xor    %eax,%eax
}
 799:	5b                   	pop    %ebx
 79a:	5e                   	pop    %esi
 79b:	5f                   	pop    %edi
 79c:	5d                   	pop    %ebp
 79d:	c3                   	ret    
    if(p->s.size >= nunits){
 79e:	89 d0                	mov    %edx,%eax
 7a0:	89 fa                	mov    %edi,%edx
 7a2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
 7a8:	39 ce                	cmp    %ecx,%esi
 7aa:	74 54                	je     800 <malloc+0x100>
        p->s.size -= nunits;
 7ac:	29 f1                	sub    %esi,%ecx
 7ae:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 7b1:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 7b4:	89 70 04             	mov    %esi,0x4(%eax)
      freep = prevp;
 7b7:	89 15 a0 0b 00 00    	mov    %edx,0xba0
}
 7bd:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 7c0:	83 c0 08             	add    $0x8,%eax
}
 7c3:	5b                   	pop    %ebx
 7c4:	5e                   	pop    %esi
 7c5:	5f                   	pop    %edi
 7c6:	5d                   	pop    %ebp
 7c7:	c3                   	ret    
 7c8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 7cf:	90                   	nop
    base.s.ptr = freep = prevp = &base;
 7d0:	c7 05 a0 0b 00 00 a4 	movl   $0xba4,0xba0
 7d7:	0b 00 00 
    base.s.size = 0;
 7da:	bf a4 0b 00 00       	mov    $0xba4,%edi
    base.s.ptr = freep = prevp = &base;
 7df:	c7 05 a4 0b 00 00 a4 	movl   $0xba4,0xba4
 7e6:	0b 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 7e9:	89 fa                	mov    %edi,%edx
    base.s.size = 0;
 7eb:	c7 05 a8 0b 00 00 00 	movl   $0x0,0xba8
 7f2:	00 00 00 
    if(p->s.size >= nunits){
 7f5:	e9 32 ff ff ff       	jmp    72c <malloc+0x2c>
 7fa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
 800:	8b 08                	mov    (%eax),%ecx
 802:	89 0a                	mov    %ecx,(%edx)
 804:	eb b1                	jmp    7b7 <malloc+0xb7>
