
_init：     文件格式 elf32-i386


Disassembly of section .text:

00000000 <main>:

char *argv[] = { "sh", 0 };

int
main(void)
{
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	pushl  -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	53                   	push   %ebx
   e:	51                   	push   %ecx
  int pid, wpid;

  if(open("console", O_RDWR) < 0){
   f:	83 ec 08             	sub    $0x8,%esp
  12:	6a 02                	push   $0x2
  14:	68 48 08 00 00       	push   $0x848
  19:	e8 63 03 00 00       	call   381 <open>
  1e:	83 c4 10             	add    $0x10,%esp
  21:	85 c0                	test   %eax,%eax
  23:	0f 88 9f 00 00 00    	js     c8 <main+0xc8>
    mknod("console", 1, 1);
    open("console", O_RDWR);
  }
  dup(0);  // stdout
  29:	83 ec 0c             	sub    $0xc,%esp
  2c:	6a 00                	push   $0x0
  2e:	e8 86 03 00 00       	call   3b9 <dup>
  dup(0);  // stderr
  33:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  3a:	e8 7a 03 00 00       	call   3b9 <dup>
  3f:	83 c4 10             	add    $0x10,%esp
  42:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

  for(;;){
    printf(1, "init: starting sh\n");
  48:	83 ec 08             	sub    $0x8,%esp
  4b:	68 50 08 00 00       	push   $0x850
  50:	6a 01                	push   $0x1
  52:	e8 89 04 00 00       	call   4e0 <printf>
    pid = fork();
  57:	e8 dd 02 00 00       	call   339 <fork>
    if(pid < 0){
  5c:	83 c4 10             	add    $0x10,%esp
    pid = fork();
  5f:	89 c3                	mov    %eax,%ebx
    if(pid < 0){
  61:	85 c0                	test   %eax,%eax
  63:	78 2c                	js     91 <main+0x91>
      printf(1, "init: fork failed\n");
      exit();
    }
    if(pid == 0){
  65:	74 3d                	je     a4 <main+0xa4>
  67:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  6e:	66 90                	xchg   %ax,%ax
      exec("sh", argv);
      printf(1, "init: exec sh failed\n");
      exit();
    }
    while((wpid=wait()) >= 0 && wpid != pid)
  70:	e8 d4 02 00 00       	call   349 <wait>
  75:	85 c0                	test   %eax,%eax
  77:	78 cf                	js     48 <main+0x48>
  79:	39 c3                	cmp    %eax,%ebx
  7b:	74 cb                	je     48 <main+0x48>
      printf(1, "zombie!\n");
  7d:	83 ec 08             	sub    $0x8,%esp
  80:	68 8f 08 00 00       	push   $0x88f
  85:	6a 01                	push   $0x1
  87:	e8 54 04 00 00       	call   4e0 <printf>
  8c:	83 c4 10             	add    $0x10,%esp
  8f:	eb df                	jmp    70 <main+0x70>
      printf(1, "init: fork failed\n");
  91:	53                   	push   %ebx
  92:	53                   	push   %ebx
  93:	68 63 08 00 00       	push   $0x863
  98:	6a 01                	push   $0x1
  9a:	e8 41 04 00 00       	call   4e0 <printf>
      exit();
  9f:	e8 9d 02 00 00       	call   341 <exit>
      exec("sh", argv);
  a4:	50                   	push   %eax
  a5:	50                   	push   %eax
  a6:	68 4c 0b 00 00       	push   $0xb4c
  ab:	68 76 08 00 00       	push   $0x876
  b0:	e8 c4 02 00 00       	call   379 <exec>
      printf(1, "init: exec sh failed\n");
  b5:	5a                   	pop    %edx
  b6:	59                   	pop    %ecx
  b7:	68 79 08 00 00       	push   $0x879
  bc:	6a 01                	push   $0x1
  be:	e8 1d 04 00 00       	call   4e0 <printf>
      exit();
  c3:	e8 79 02 00 00       	call   341 <exit>
    mknod("console", 1, 1);
  c8:	50                   	push   %eax
  c9:	6a 01                	push   $0x1
  cb:	6a 01                	push   $0x1
  cd:	68 48 08 00 00       	push   $0x848
  d2:	e8 b2 02 00 00       	call   389 <mknod>
    open("console", O_RDWR);
  d7:	58                   	pop    %eax
  d8:	5a                   	pop    %edx
  d9:	6a 02                	push   $0x2
  db:	68 48 08 00 00       	push   $0x848
  e0:	e8 9c 02 00 00       	call   381 <open>
  e5:	83 c4 10             	add    $0x10,%esp
  e8:	e9 3c ff ff ff       	jmp    29 <main+0x29>
  ed:	66 90                	xchg   %ax,%ax
  ef:	90                   	nop

000000f0 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
  f0:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  f1:	31 d2                	xor    %edx,%edx
{
  f3:	89 e5                	mov    %esp,%ebp
  f5:	53                   	push   %ebx
  f6:	8b 45 08             	mov    0x8(%ebp),%eax
  f9:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((*s++ = *t++) != 0)
 100:	0f b6 0c 13          	movzbl (%ebx,%edx,1),%ecx
 104:	88 0c 10             	mov    %cl,(%eax,%edx,1)
 107:	83 c2 01             	add    $0x1,%edx
 10a:	84 c9                	test   %cl,%cl
 10c:	75 f2                	jne    100 <strcpy+0x10>
    ;
  return os;
}
 10e:	5b                   	pop    %ebx
 10f:	5d                   	pop    %ebp
 110:	c3                   	ret    
 111:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 118:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 11f:	90                   	nop

00000120 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 120:	55                   	push   %ebp
 121:	89 e5                	mov    %esp,%ebp
 123:	56                   	push   %esi
 124:	53                   	push   %ebx
 125:	8b 5d 08             	mov    0x8(%ebp),%ebx
 128:	8b 75 0c             	mov    0xc(%ebp),%esi
  while(*p && *p == *q)
 12b:	0f b6 13             	movzbl (%ebx),%edx
 12e:	0f b6 0e             	movzbl (%esi),%ecx
 131:	84 d2                	test   %dl,%dl
 133:	74 1e                	je     153 <strcmp+0x33>
 135:	b8 01 00 00 00       	mov    $0x1,%eax
 13a:	38 ca                	cmp    %cl,%dl
 13c:	74 09                	je     147 <strcmp+0x27>
 13e:	eb 20                	jmp    160 <strcmp+0x40>
 140:	83 c0 01             	add    $0x1,%eax
 143:	38 ca                	cmp    %cl,%dl
 145:	75 19                	jne    160 <strcmp+0x40>
 147:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
 14b:	0f b6 0c 06          	movzbl (%esi,%eax,1),%ecx
 14f:	84 d2                	test   %dl,%dl
 151:	75 ed                	jne    140 <strcmp+0x20>
 153:	31 c0                	xor    %eax,%eax
    p++, q++;
  return (uchar)*p - (uchar)*q;
}
 155:	5b                   	pop    %ebx
 156:	5e                   	pop    %esi
  return (uchar)*p - (uchar)*q;
 157:	29 c8                	sub    %ecx,%eax
}
 159:	5d                   	pop    %ebp
 15a:	c3                   	ret    
 15b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 15f:	90                   	nop
 160:	0f b6 c2             	movzbl %dl,%eax
 163:	5b                   	pop    %ebx
 164:	5e                   	pop    %esi
  return (uchar)*p - (uchar)*q;
 165:	29 c8                	sub    %ecx,%eax
}
 167:	5d                   	pop    %ebp
 168:	c3                   	ret    
 169:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000170 <strlen>:

uint
strlen(const char *s)
{
 170:	55                   	push   %ebp
 171:	89 e5                	mov    %esp,%ebp
 173:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 176:	80 39 00             	cmpb   $0x0,(%ecx)
 179:	74 15                	je     190 <strlen+0x20>
 17b:	31 d2                	xor    %edx,%edx
 17d:	8d 76 00             	lea    0x0(%esi),%esi
 180:	83 c2 01             	add    $0x1,%edx
 183:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
 187:	89 d0                	mov    %edx,%eax
 189:	75 f5                	jne    180 <strlen+0x10>
    ;
  return n;
}
 18b:	5d                   	pop    %ebp
 18c:	c3                   	ret    
 18d:	8d 76 00             	lea    0x0(%esi),%esi
  for(n = 0; s[n]; n++)
 190:	31 c0                	xor    %eax,%eax
}
 192:	5d                   	pop    %ebp
 193:	c3                   	ret    
 194:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 19b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 19f:	90                   	nop

000001a0 <memset>:

void*
memset(void *dst, int c, uint n)
{
 1a0:	55                   	push   %ebp
 1a1:	89 e5                	mov    %esp,%ebp
 1a3:	57                   	push   %edi
 1a4:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 1a7:	8b 4d 10             	mov    0x10(%ebp),%ecx
 1aa:	8b 45 0c             	mov    0xc(%ebp),%eax
 1ad:	89 d7                	mov    %edx,%edi
 1af:	fc                   	cld    
 1b0:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 1b2:	89 d0                	mov    %edx,%eax
 1b4:	5f                   	pop    %edi
 1b5:	5d                   	pop    %ebp
 1b6:	c3                   	ret    
 1b7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1be:	66 90                	xchg   %ax,%ax

000001c0 <strchr>:

char*
strchr(const char *s, char c)
{
 1c0:	55                   	push   %ebp
 1c1:	89 e5                	mov    %esp,%ebp
 1c3:	53                   	push   %ebx
 1c4:	8b 45 08             	mov    0x8(%ebp),%eax
 1c7:	8b 55 0c             	mov    0xc(%ebp),%edx
  for(; *s; s++)
 1ca:	0f b6 18             	movzbl (%eax),%ebx
 1cd:	84 db                	test   %bl,%bl
 1cf:	74 1d                	je     1ee <strchr+0x2e>
 1d1:	89 d1                	mov    %edx,%ecx
    if(*s == c)
 1d3:	38 d3                	cmp    %dl,%bl
 1d5:	75 0d                	jne    1e4 <strchr+0x24>
 1d7:	eb 17                	jmp    1f0 <strchr+0x30>
 1d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1e0:	38 ca                	cmp    %cl,%dl
 1e2:	74 0c                	je     1f0 <strchr+0x30>
  for(; *s; s++)
 1e4:	83 c0 01             	add    $0x1,%eax
 1e7:	0f b6 10             	movzbl (%eax),%edx
 1ea:	84 d2                	test   %dl,%dl
 1ec:	75 f2                	jne    1e0 <strchr+0x20>
      return (char*)s;
  return 0;
 1ee:	31 c0                	xor    %eax,%eax
}
 1f0:	5b                   	pop    %ebx
 1f1:	5d                   	pop    %ebp
 1f2:	c3                   	ret    
 1f3:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1fa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000200 <gets>:

char*
gets(char *buf, int max)
{
 200:	55                   	push   %ebp
 201:	89 e5                	mov    %esp,%ebp
 203:	57                   	push   %edi
 204:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 205:	31 f6                	xor    %esi,%esi
{
 207:	53                   	push   %ebx
 208:	89 f3                	mov    %esi,%ebx
 20a:	83 ec 1c             	sub    $0x1c,%esp
 20d:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i=0; i+1 < max; ){
 210:	eb 2f                	jmp    241 <gets+0x41>
 212:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    cc = read(0, &c, 1);
 218:	83 ec 04             	sub    $0x4,%esp
 21b:	8d 45 e7             	lea    -0x19(%ebp),%eax
 21e:	6a 01                	push   $0x1
 220:	50                   	push   %eax
 221:	6a 00                	push   $0x0
 223:	e8 31 01 00 00       	call   359 <read>
    if(cc < 1)
 228:	83 c4 10             	add    $0x10,%esp
 22b:	85 c0                	test   %eax,%eax
 22d:	7e 1c                	jle    24b <gets+0x4b>
      break;
    buf[i++] = c;
 22f:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 233:	83 c7 01             	add    $0x1,%edi
 236:	88 47 ff             	mov    %al,-0x1(%edi)
    if(c == '\n' || c == '\r')
 239:	3c 0a                	cmp    $0xa,%al
 23b:	74 23                	je     260 <gets+0x60>
 23d:	3c 0d                	cmp    $0xd,%al
 23f:	74 1f                	je     260 <gets+0x60>
  for(i=0; i+1 < max; ){
 241:	83 c3 01             	add    $0x1,%ebx
 244:	89 fe                	mov    %edi,%esi
 246:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 249:	7c cd                	jl     218 <gets+0x18>
 24b:	89 f3                	mov    %esi,%ebx
      break;
  }
  buf[i] = '\0';
  return buf;
}
 24d:	8b 45 08             	mov    0x8(%ebp),%eax
  buf[i] = '\0';
 250:	c6 03 00             	movb   $0x0,(%ebx)
}
 253:	8d 65 f4             	lea    -0xc(%ebp),%esp
 256:	5b                   	pop    %ebx
 257:	5e                   	pop    %esi
 258:	5f                   	pop    %edi
 259:	5d                   	pop    %ebp
 25a:	c3                   	ret    
 25b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 25f:	90                   	nop
 260:	8b 75 08             	mov    0x8(%ebp),%esi
 263:	8b 45 08             	mov    0x8(%ebp),%eax
 266:	01 de                	add    %ebx,%esi
 268:	89 f3                	mov    %esi,%ebx
  buf[i] = '\0';
 26a:	c6 03 00             	movb   $0x0,(%ebx)
}
 26d:	8d 65 f4             	lea    -0xc(%ebp),%esp
 270:	5b                   	pop    %ebx
 271:	5e                   	pop    %esi
 272:	5f                   	pop    %edi
 273:	5d                   	pop    %ebp
 274:	c3                   	ret    
 275:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 27c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000280 <stat>:

int
stat(const char *n, struct stat *st)
{
 280:	55                   	push   %ebp
 281:	89 e5                	mov    %esp,%ebp
 283:	56                   	push   %esi
 284:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 285:	83 ec 08             	sub    $0x8,%esp
 288:	6a 00                	push   $0x0
 28a:	ff 75 08             	pushl  0x8(%ebp)
 28d:	e8 ef 00 00 00       	call   381 <open>
  if(fd < 0)
 292:	83 c4 10             	add    $0x10,%esp
 295:	85 c0                	test   %eax,%eax
 297:	78 27                	js     2c0 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 299:	83 ec 08             	sub    $0x8,%esp
 29c:	ff 75 0c             	pushl  0xc(%ebp)
 29f:	89 c3                	mov    %eax,%ebx
 2a1:	50                   	push   %eax
 2a2:	e8 f2 00 00 00       	call   399 <fstat>
  close(fd);
 2a7:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 2aa:	89 c6                	mov    %eax,%esi
  close(fd);
 2ac:	e8 b8 00 00 00       	call   369 <close>
  return r;
 2b1:	83 c4 10             	add    $0x10,%esp
}
 2b4:	8d 65 f8             	lea    -0x8(%ebp),%esp
 2b7:	89 f0                	mov    %esi,%eax
 2b9:	5b                   	pop    %ebx
 2ba:	5e                   	pop    %esi
 2bb:	5d                   	pop    %ebp
 2bc:	c3                   	ret    
 2bd:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 2c0:	be ff ff ff ff       	mov    $0xffffffff,%esi
 2c5:	eb ed                	jmp    2b4 <stat+0x34>
 2c7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 2ce:	66 90                	xchg   %ax,%ax

000002d0 <atoi>:

int
atoi(const char *s)
{
 2d0:	55                   	push   %ebp
 2d1:	89 e5                	mov    %esp,%ebp
 2d3:	53                   	push   %ebx
 2d4:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 2d7:	0f be 11             	movsbl (%ecx),%edx
 2da:	8d 42 d0             	lea    -0x30(%edx),%eax
 2dd:	3c 09                	cmp    $0x9,%al
  n = 0;
 2df:	b8 00 00 00 00       	mov    $0x0,%eax
  while('0' <= *s && *s <= '9')
 2e4:	77 1f                	ja     305 <atoi+0x35>
 2e6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 2ed:	8d 76 00             	lea    0x0(%esi),%esi
    n = n*10 + *s++ - '0';
 2f0:	83 c1 01             	add    $0x1,%ecx
 2f3:	8d 04 80             	lea    (%eax,%eax,4),%eax
 2f6:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
  while('0' <= *s && *s <= '9')
 2fa:	0f be 11             	movsbl (%ecx),%edx
 2fd:	8d 5a d0             	lea    -0x30(%edx),%ebx
 300:	80 fb 09             	cmp    $0x9,%bl
 303:	76 eb                	jbe    2f0 <atoi+0x20>
  return n;
}
 305:	5b                   	pop    %ebx
 306:	5d                   	pop    %ebp
 307:	c3                   	ret    
 308:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 30f:	90                   	nop

00000310 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 310:	55                   	push   %ebp
 311:	89 e5                	mov    %esp,%ebp
 313:	57                   	push   %edi
 314:	8b 55 10             	mov    0x10(%ebp),%edx
 317:	8b 45 08             	mov    0x8(%ebp),%eax
 31a:	56                   	push   %esi
 31b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 31e:	85 d2                	test   %edx,%edx
 320:	7e 13                	jle    335 <memmove+0x25>
 322:	01 c2                	add    %eax,%edx
  dst = vdst;
 324:	89 c7                	mov    %eax,%edi
 326:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 32d:	8d 76 00             	lea    0x0(%esi),%esi
    *dst++ = *src++;
 330:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 331:	39 fa                	cmp    %edi,%edx
 333:	75 fb                	jne    330 <memmove+0x20>
  return vdst;
}
 335:	5e                   	pop    %esi
 336:	5f                   	pop    %edi
 337:	5d                   	pop    %ebp
 338:	c3                   	ret    

00000339 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 339:	b8 01 00 00 00       	mov    $0x1,%eax
 33e:	cd 40                	int    $0x40
 340:	c3                   	ret    

00000341 <exit>:
SYSCALL(exit)
 341:	b8 02 00 00 00       	mov    $0x2,%eax
 346:	cd 40                	int    $0x40
 348:	c3                   	ret    

00000349 <wait>:
SYSCALL(wait)
 349:	b8 03 00 00 00       	mov    $0x3,%eax
 34e:	cd 40                	int    $0x40
 350:	c3                   	ret    

00000351 <pipe>:
SYSCALL(pipe)
 351:	b8 04 00 00 00       	mov    $0x4,%eax
 356:	cd 40                	int    $0x40
 358:	c3                   	ret    

00000359 <read>:
SYSCALL(read)
 359:	b8 05 00 00 00       	mov    $0x5,%eax
 35e:	cd 40                	int    $0x40
 360:	c3                   	ret    

00000361 <write>:
SYSCALL(write)
 361:	b8 10 00 00 00       	mov    $0x10,%eax
 366:	cd 40                	int    $0x40
 368:	c3                   	ret    

00000369 <close>:
SYSCALL(close)
 369:	b8 15 00 00 00       	mov    $0x15,%eax
 36e:	cd 40                	int    $0x40
 370:	c3                   	ret    

00000371 <kill>:
SYSCALL(kill)
 371:	b8 06 00 00 00       	mov    $0x6,%eax
 376:	cd 40                	int    $0x40
 378:	c3                   	ret    

00000379 <exec>:
SYSCALL(exec)
 379:	b8 07 00 00 00       	mov    $0x7,%eax
 37e:	cd 40                	int    $0x40
 380:	c3                   	ret    

00000381 <open>:
SYSCALL(open)
 381:	b8 0f 00 00 00       	mov    $0xf,%eax
 386:	cd 40                	int    $0x40
 388:	c3                   	ret    

00000389 <mknod>:
SYSCALL(mknod)
 389:	b8 11 00 00 00       	mov    $0x11,%eax
 38e:	cd 40                	int    $0x40
 390:	c3                   	ret    

00000391 <unlink>:
SYSCALL(unlink)
 391:	b8 12 00 00 00       	mov    $0x12,%eax
 396:	cd 40                	int    $0x40
 398:	c3                   	ret    

00000399 <fstat>:
SYSCALL(fstat)
 399:	b8 08 00 00 00       	mov    $0x8,%eax
 39e:	cd 40                	int    $0x40
 3a0:	c3                   	ret    

000003a1 <link>:
SYSCALL(link)
 3a1:	b8 13 00 00 00       	mov    $0x13,%eax
 3a6:	cd 40                	int    $0x40
 3a8:	c3                   	ret    

000003a9 <mkdir>:
SYSCALL(mkdir)
 3a9:	b8 14 00 00 00       	mov    $0x14,%eax
 3ae:	cd 40                	int    $0x40
 3b0:	c3                   	ret    

000003b1 <chdir>:
SYSCALL(chdir)
 3b1:	b8 09 00 00 00       	mov    $0x9,%eax
 3b6:	cd 40                	int    $0x40
 3b8:	c3                   	ret    

000003b9 <dup>:
SYSCALL(dup)
 3b9:	b8 0a 00 00 00       	mov    $0xa,%eax
 3be:	cd 40                	int    $0x40
 3c0:	c3                   	ret    

000003c1 <getpid>:
SYSCALL(getpid)
 3c1:	b8 0b 00 00 00       	mov    $0xb,%eax
 3c6:	cd 40                	int    $0x40
 3c8:	c3                   	ret    

000003c9 <sbrk>:
SYSCALL(sbrk)
 3c9:	b8 0c 00 00 00       	mov    $0xc,%eax
 3ce:	cd 40                	int    $0x40
 3d0:	c3                   	ret    

000003d1 <sleep>:
SYSCALL(sleep)
 3d1:	b8 0d 00 00 00       	mov    $0xd,%eax
 3d6:	cd 40                	int    $0x40
 3d8:	c3                   	ret    

000003d9 <uptime>:
SYSCALL(uptime)
 3d9:	b8 0e 00 00 00       	mov    $0xe,%eax
 3de:	cd 40                	int    $0x40
 3e0:	c3                   	ret    

000003e1 <printingMyFavoriteYear>:
SYSCALL(printingMyFavoriteYear)
 3e1:	b8 16 00 00 00       	mov    $0x16,%eax
 3e6:	cd 40                	int    $0x40
 3e8:	c3                   	ret    

000003e9 <getChildren>:
SYSCALL(getChildren)
 3e9:	b8 17 00 00 00       	mov    $0x17,%eax
 3ee:	cd 40                	int    $0x40
 3f0:	c3                   	ret    

000003f1 <getRunningProcessPID>:
SYSCALL(getRunningProcessPID)
 3f1:	b8 18 00 00 00       	mov    $0x18,%eax
 3f6:	cd 40                	int    $0x40
 3f8:	c3                   	ret    

000003f9 <changePolicy>:
SYSCALL(changePolicy)
 3f9:	b8 19 00 00 00       	mov    $0x19,%eax
 3fe:	cd 40                	int    $0x40
 400:	c3                   	ret    

00000401 <Quantum_Increaser>:
SYSCALL(Quantum_Increaser)
 401:	b8 1a 00 00 00       	mov    $0x1a,%eax
 406:	cd 40                	int    $0x40
 408:	c3                   	ret    

00000409 <Quantum_Decreaser>:
SYSCALL(Quantum_Decreaser)
 409:	b8 1b 00 00 00       	mov    $0x1b,%eax
 40e:	cd 40                	int    $0x40
 410:	c3                   	ret    
 411:	66 90                	xchg   %ax,%ax
 413:	66 90                	xchg   %ax,%ax
 415:	66 90                	xchg   %ax,%ax
 417:	66 90                	xchg   %ax,%ax
 419:	66 90                	xchg   %ax,%ax
 41b:	66 90                	xchg   %ax,%ax
 41d:	66 90                	xchg   %ax,%ax
 41f:	90                   	nop

00000420 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 420:	55                   	push   %ebp
 421:	89 e5                	mov    %esp,%ebp
 423:	57                   	push   %edi
 424:	56                   	push   %esi
 425:	53                   	push   %ebx
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 426:	89 d3                	mov    %edx,%ebx
{
 428:	83 ec 3c             	sub    $0x3c,%esp
 42b:	89 45 bc             	mov    %eax,-0x44(%ebp)
  if(sgn && xx < 0){
 42e:	85 d2                	test   %edx,%edx
 430:	0f 89 92 00 00 00    	jns    4c8 <printint+0xa8>
 436:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 43a:	0f 84 88 00 00 00    	je     4c8 <printint+0xa8>
    neg = 1;
 440:	c7 45 c0 01 00 00 00 	movl   $0x1,-0x40(%ebp)
    x = -xx;
 447:	f7 db                	neg    %ebx
  } else {
    x = xx;
  }

  i = 0;
 449:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
 450:	8d 75 d7             	lea    -0x29(%ebp),%esi
 453:	eb 08                	jmp    45d <printint+0x3d>
 455:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 458:	89 7d c4             	mov    %edi,-0x3c(%ebp)
  }while((x /= base) != 0);
 45b:	89 c3                	mov    %eax,%ebx
    buf[i++] = digits[x % base];
 45d:	89 d8                	mov    %ebx,%eax
 45f:	31 d2                	xor    %edx,%edx
 461:	8b 7d c4             	mov    -0x3c(%ebp),%edi
 464:	f7 f1                	div    %ecx
 466:	83 c7 01             	add    $0x1,%edi
 469:	0f b6 92 a0 08 00 00 	movzbl 0x8a0(%edx),%edx
 470:	88 14 3e             	mov    %dl,(%esi,%edi,1)
  }while((x /= base) != 0);
 473:	39 d9                	cmp    %ebx,%ecx
 475:	76 e1                	jbe    458 <printint+0x38>
  if(neg)
 477:	8b 45 c0             	mov    -0x40(%ebp),%eax
 47a:	85 c0                	test   %eax,%eax
 47c:	74 0d                	je     48b <printint+0x6b>
    buf[i++] = '-';
 47e:	c6 44 3d d8 2d       	movb   $0x2d,-0x28(%ebp,%edi,1)
 483:	ba 2d 00 00 00       	mov    $0x2d,%edx
    buf[i++] = digits[x % base];
 488:	89 7d c4             	mov    %edi,-0x3c(%ebp)
 48b:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 48e:	8b 7d bc             	mov    -0x44(%ebp),%edi
 491:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
 495:	eb 0f                	jmp    4a6 <printint+0x86>
 497:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 49e:	66 90                	xchg   %ax,%ax
 4a0:	0f b6 13             	movzbl (%ebx),%edx
 4a3:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
 4a6:	83 ec 04             	sub    $0x4,%esp
 4a9:	88 55 d7             	mov    %dl,-0x29(%ebp)
 4ac:	6a 01                	push   $0x1
 4ae:	56                   	push   %esi
 4af:	57                   	push   %edi
 4b0:	e8 ac fe ff ff       	call   361 <write>

  while(--i >= 0)
 4b5:	83 c4 10             	add    $0x10,%esp
 4b8:	39 de                	cmp    %ebx,%esi
 4ba:	75 e4                	jne    4a0 <printint+0x80>
    putc(fd, buf[i]);
}
 4bc:	8d 65 f4             	lea    -0xc(%ebp),%esp
 4bf:	5b                   	pop    %ebx
 4c0:	5e                   	pop    %esi
 4c1:	5f                   	pop    %edi
 4c2:	5d                   	pop    %ebp
 4c3:	c3                   	ret    
 4c4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 4c8:	c7 45 c0 00 00 00 00 	movl   $0x0,-0x40(%ebp)
 4cf:	e9 75 ff ff ff       	jmp    449 <printint+0x29>
 4d4:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 4db:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 4df:	90                   	nop

000004e0 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 4e0:	55                   	push   %ebp
 4e1:	89 e5                	mov    %esp,%ebp
 4e3:	57                   	push   %edi
 4e4:	56                   	push   %esi
 4e5:	53                   	push   %ebx
 4e6:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 4e9:	8b 75 0c             	mov    0xc(%ebp),%esi
 4ec:	0f b6 1e             	movzbl (%esi),%ebx
 4ef:	84 db                	test   %bl,%bl
 4f1:	0f 84 b9 00 00 00    	je     5b0 <printf+0xd0>
  ap = (uint*)(void*)&fmt + 1;
 4f7:	8d 45 10             	lea    0x10(%ebp),%eax
 4fa:	83 c6 01             	add    $0x1,%esi
  write(fd, &c, 1);
 4fd:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
 500:	31 d2                	xor    %edx,%edx
  ap = (uint*)(void*)&fmt + 1;
 502:	89 45 d0             	mov    %eax,-0x30(%ebp)
 505:	eb 38                	jmp    53f <printf+0x5f>
 507:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 50e:	66 90                	xchg   %ax,%ax
 510:	89 55 d4             	mov    %edx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 513:	ba 25 00 00 00       	mov    $0x25,%edx
      if(c == '%'){
 518:	83 f8 25             	cmp    $0x25,%eax
 51b:	74 17                	je     534 <printf+0x54>
  write(fd, &c, 1);
 51d:	83 ec 04             	sub    $0x4,%esp
 520:	88 5d e7             	mov    %bl,-0x19(%ebp)
 523:	6a 01                	push   $0x1
 525:	57                   	push   %edi
 526:	ff 75 08             	pushl  0x8(%ebp)
 529:	e8 33 fe ff ff       	call   361 <write>
 52e:	8b 55 d4             	mov    -0x2c(%ebp),%edx
      } else {
        putc(fd, c);
 531:	83 c4 10             	add    $0x10,%esp
 534:	83 c6 01             	add    $0x1,%esi
  for(i = 0; fmt[i]; i++){
 537:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
 53b:	84 db                	test   %bl,%bl
 53d:	74 71                	je     5b0 <printf+0xd0>
    c = fmt[i] & 0xff;
 53f:	0f be cb             	movsbl %bl,%ecx
 542:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
 545:	85 d2                	test   %edx,%edx
 547:	74 c7                	je     510 <printf+0x30>
      }
    } else if(state == '%'){
 549:	83 fa 25             	cmp    $0x25,%edx
 54c:	75 e6                	jne    534 <printf+0x54>
      if(c == 'd'){
 54e:	83 f8 64             	cmp    $0x64,%eax
 551:	0f 84 99 00 00 00    	je     5f0 <printf+0x110>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 557:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
 55d:	83 f9 70             	cmp    $0x70,%ecx
 560:	74 5e                	je     5c0 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 562:	83 f8 73             	cmp    $0x73,%eax
 565:	0f 84 d5 00 00 00    	je     640 <printf+0x160>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 56b:	83 f8 63             	cmp    $0x63,%eax
 56e:	0f 84 8c 00 00 00    	je     600 <printf+0x120>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 574:	83 f8 25             	cmp    $0x25,%eax
 577:	0f 84 b3 00 00 00    	je     630 <printf+0x150>
  write(fd, &c, 1);
 57d:	83 ec 04             	sub    $0x4,%esp
 580:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 584:	6a 01                	push   $0x1
 586:	57                   	push   %edi
 587:	ff 75 08             	pushl  0x8(%ebp)
 58a:	e8 d2 fd ff ff       	call   361 <write>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
 58f:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
 592:	83 c4 0c             	add    $0xc,%esp
 595:	6a 01                	push   $0x1
 597:	83 c6 01             	add    $0x1,%esi
 59a:	57                   	push   %edi
 59b:	ff 75 08             	pushl  0x8(%ebp)
 59e:	e8 be fd ff ff       	call   361 <write>
  for(i = 0; fmt[i]; i++){
 5a3:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
        putc(fd, c);
 5a7:	83 c4 10             	add    $0x10,%esp
      }
      state = 0;
 5aa:	31 d2                	xor    %edx,%edx
  for(i = 0; fmt[i]; i++){
 5ac:	84 db                	test   %bl,%bl
 5ae:	75 8f                	jne    53f <printf+0x5f>
    }
  }
}
 5b0:	8d 65 f4             	lea    -0xc(%ebp),%esp
 5b3:	5b                   	pop    %ebx
 5b4:	5e                   	pop    %esi
 5b5:	5f                   	pop    %edi
 5b6:	5d                   	pop    %ebp
 5b7:	c3                   	ret    
 5b8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 5bf:	90                   	nop
        printint(fd, *ap, 16, 0);
 5c0:	83 ec 0c             	sub    $0xc,%esp
 5c3:	b9 10 00 00 00       	mov    $0x10,%ecx
 5c8:	6a 00                	push   $0x0
 5ca:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 5cd:	8b 45 08             	mov    0x8(%ebp),%eax
 5d0:	8b 13                	mov    (%ebx),%edx
 5d2:	e8 49 fe ff ff       	call   420 <printint>
        ap++;
 5d7:	89 d8                	mov    %ebx,%eax
 5d9:	83 c4 10             	add    $0x10,%esp
      state = 0;
 5dc:	31 d2                	xor    %edx,%edx
        ap++;
 5de:	83 c0 04             	add    $0x4,%eax
 5e1:	89 45 d0             	mov    %eax,-0x30(%ebp)
 5e4:	e9 4b ff ff ff       	jmp    534 <printf+0x54>
 5e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        printint(fd, *ap, 10, 1);
 5f0:	83 ec 0c             	sub    $0xc,%esp
 5f3:	b9 0a 00 00 00       	mov    $0xa,%ecx
 5f8:	6a 01                	push   $0x1
 5fa:	eb ce                	jmp    5ca <printf+0xea>
 5fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        putc(fd, *ap);
 600:	8b 5d d0             	mov    -0x30(%ebp),%ebx
  write(fd, &c, 1);
 603:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
 606:	8b 03                	mov    (%ebx),%eax
  write(fd, &c, 1);
 608:	6a 01                	push   $0x1
        ap++;
 60a:	83 c3 04             	add    $0x4,%ebx
  write(fd, &c, 1);
 60d:	57                   	push   %edi
 60e:	ff 75 08             	pushl  0x8(%ebp)
        putc(fd, *ap);
 611:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 614:	e8 48 fd ff ff       	call   361 <write>
        ap++;
 619:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 61c:	83 c4 10             	add    $0x10,%esp
      state = 0;
 61f:	31 d2                	xor    %edx,%edx
 621:	e9 0e ff ff ff       	jmp    534 <printf+0x54>
 626:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 62d:	8d 76 00             	lea    0x0(%esi),%esi
        putc(fd, c);
 630:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
 633:	83 ec 04             	sub    $0x4,%esp
 636:	e9 5a ff ff ff       	jmp    595 <printf+0xb5>
 63b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 63f:	90                   	nop
        s = (char*)*ap;
 640:	8b 45 d0             	mov    -0x30(%ebp),%eax
 643:	8b 18                	mov    (%eax),%ebx
        ap++;
 645:	83 c0 04             	add    $0x4,%eax
 648:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 64b:	85 db                	test   %ebx,%ebx
 64d:	74 17                	je     666 <printf+0x186>
        while(*s != 0){
 64f:	0f b6 03             	movzbl (%ebx),%eax
      state = 0;
 652:	31 d2                	xor    %edx,%edx
        while(*s != 0){
 654:	84 c0                	test   %al,%al
 656:	0f 84 d8 fe ff ff    	je     534 <printf+0x54>
 65c:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 65f:	89 de                	mov    %ebx,%esi
 661:	8b 5d 08             	mov    0x8(%ebp),%ebx
 664:	eb 1a                	jmp    680 <printf+0x1a0>
          s = "(null)";
 666:	bb 98 08 00 00       	mov    $0x898,%ebx
        while(*s != 0){
 66b:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 66e:	b8 28 00 00 00       	mov    $0x28,%eax
 673:	89 de                	mov    %ebx,%esi
 675:	8b 5d 08             	mov    0x8(%ebp),%ebx
 678:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 67f:	90                   	nop
  write(fd, &c, 1);
 680:	83 ec 04             	sub    $0x4,%esp
          s++;
 683:	83 c6 01             	add    $0x1,%esi
 686:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 689:	6a 01                	push   $0x1
 68b:	57                   	push   %edi
 68c:	53                   	push   %ebx
 68d:	e8 cf fc ff ff       	call   361 <write>
        while(*s != 0){
 692:	0f b6 06             	movzbl (%esi),%eax
 695:	83 c4 10             	add    $0x10,%esp
 698:	84 c0                	test   %al,%al
 69a:	75 e4                	jne    680 <printf+0x1a0>
 69c:	8b 75 d4             	mov    -0x2c(%ebp),%esi
      state = 0;
 69f:	31 d2                	xor    %edx,%edx
 6a1:	e9 8e fe ff ff       	jmp    534 <printf+0x54>
 6a6:	66 90                	xchg   %ax,%ax
 6a8:	66 90                	xchg   %ax,%ax
 6aa:	66 90                	xchg   %ax,%ax
 6ac:	66 90                	xchg   %ax,%ax
 6ae:	66 90                	xchg   %ax,%ax

000006b0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 6b0:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 6b1:	a1 54 0b 00 00       	mov    0xb54,%eax
{
 6b6:	89 e5                	mov    %esp,%ebp
 6b8:	57                   	push   %edi
 6b9:	56                   	push   %esi
 6ba:	53                   	push   %ebx
 6bb:	8b 5d 08             	mov    0x8(%ebp),%ebx
 6be:	8b 10                	mov    (%eax),%edx
  bp = (Header*)ap - 1;
 6c0:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 6c3:	39 c8                	cmp    %ecx,%eax
 6c5:	73 19                	jae    6e0 <free+0x30>
 6c7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 6ce:	66 90                	xchg   %ax,%ax
 6d0:	39 d1                	cmp    %edx,%ecx
 6d2:	72 14                	jb     6e8 <free+0x38>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 6d4:	39 d0                	cmp    %edx,%eax
 6d6:	73 10                	jae    6e8 <free+0x38>
{
 6d8:	89 d0                	mov    %edx,%eax
 6da:	8b 10                	mov    (%eax),%edx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 6dc:	39 c8                	cmp    %ecx,%eax
 6de:	72 f0                	jb     6d0 <free+0x20>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 6e0:	39 d0                	cmp    %edx,%eax
 6e2:	72 f4                	jb     6d8 <free+0x28>
 6e4:	39 d1                	cmp    %edx,%ecx
 6e6:	73 f0                	jae    6d8 <free+0x28>
      break;
  if(bp + bp->s.size == p->s.ptr){
 6e8:	8b 73 fc             	mov    -0x4(%ebx),%esi
 6eb:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 6ee:	39 fa                	cmp    %edi,%edx
 6f0:	74 1e                	je     710 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 6f2:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 6f5:	8b 50 04             	mov    0x4(%eax),%edx
 6f8:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 6fb:	39 f1                	cmp    %esi,%ecx
 6fd:	74 28                	je     727 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 6ff:	89 08                	mov    %ecx,(%eax)
  freep = p;
}
 701:	5b                   	pop    %ebx
  freep = p;
 702:	a3 54 0b 00 00       	mov    %eax,0xb54
}
 707:	5e                   	pop    %esi
 708:	5f                   	pop    %edi
 709:	5d                   	pop    %ebp
 70a:	c3                   	ret    
 70b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 70f:	90                   	nop
    bp->s.size += p->s.ptr->s.size;
 710:	03 72 04             	add    0x4(%edx),%esi
 713:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 716:	8b 10                	mov    (%eax),%edx
 718:	8b 12                	mov    (%edx),%edx
 71a:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 71d:	8b 50 04             	mov    0x4(%eax),%edx
 720:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 723:	39 f1                	cmp    %esi,%ecx
 725:	75 d8                	jne    6ff <free+0x4f>
    p->s.size += bp->s.size;
 727:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
 72a:	a3 54 0b 00 00       	mov    %eax,0xb54
    p->s.size += bp->s.size;
 72f:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 732:	8b 53 f8             	mov    -0x8(%ebx),%edx
 735:	89 10                	mov    %edx,(%eax)
}
 737:	5b                   	pop    %ebx
 738:	5e                   	pop    %esi
 739:	5f                   	pop    %edi
 73a:	5d                   	pop    %ebp
 73b:	c3                   	ret    
 73c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000740 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 740:	55                   	push   %ebp
 741:	89 e5                	mov    %esp,%ebp
 743:	57                   	push   %edi
 744:	56                   	push   %esi
 745:	53                   	push   %ebx
 746:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 749:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 74c:	8b 3d 54 0b 00 00    	mov    0xb54,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 752:	8d 70 07             	lea    0x7(%eax),%esi
 755:	c1 ee 03             	shr    $0x3,%esi
 758:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
 75b:	85 ff                	test   %edi,%edi
 75d:	0f 84 ad 00 00 00    	je     810 <malloc+0xd0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 763:	8b 17                	mov    (%edi),%edx
    if(p->s.size >= nunits){
 765:	8b 4a 04             	mov    0x4(%edx),%ecx
 768:	39 f1                	cmp    %esi,%ecx
 76a:	73 72                	jae    7de <malloc+0x9e>
 76c:	81 fe 00 10 00 00    	cmp    $0x1000,%esi
 772:	bb 00 10 00 00       	mov    $0x1000,%ebx
 777:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
 77a:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 781:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 784:	eb 1b                	jmp    7a1 <malloc+0x61>
 786:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 78d:	8d 76 00             	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 790:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 792:	8b 48 04             	mov    0x4(%eax),%ecx
 795:	39 f1                	cmp    %esi,%ecx
 797:	73 4f                	jae    7e8 <malloc+0xa8>
 799:	8b 3d 54 0b 00 00    	mov    0xb54,%edi
 79f:	89 c2                	mov    %eax,%edx
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 7a1:	39 d7                	cmp    %edx,%edi
 7a3:	75 eb                	jne    790 <malloc+0x50>
  p = sbrk(nu * sizeof(Header));
 7a5:	83 ec 0c             	sub    $0xc,%esp
 7a8:	ff 75 e4             	pushl  -0x1c(%ebp)
 7ab:	e8 19 fc ff ff       	call   3c9 <sbrk>
  if(p == (char*)-1)
 7b0:	83 c4 10             	add    $0x10,%esp
 7b3:	83 f8 ff             	cmp    $0xffffffff,%eax
 7b6:	74 1c                	je     7d4 <malloc+0x94>
  hp->s.size = nu;
 7b8:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 7bb:	83 ec 0c             	sub    $0xc,%esp
 7be:	83 c0 08             	add    $0x8,%eax
 7c1:	50                   	push   %eax
 7c2:	e8 e9 fe ff ff       	call   6b0 <free>
  return freep;
 7c7:	8b 15 54 0b 00 00    	mov    0xb54,%edx
      if((p = morecore(nunits)) == 0)
 7cd:	83 c4 10             	add    $0x10,%esp
 7d0:	85 d2                	test   %edx,%edx
 7d2:	75 bc                	jne    790 <malloc+0x50>
        return 0;
  }
}
 7d4:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 7d7:	31 c0                	xor    %eax,%eax
}
 7d9:	5b                   	pop    %ebx
 7da:	5e                   	pop    %esi
 7db:	5f                   	pop    %edi
 7dc:	5d                   	pop    %ebp
 7dd:	c3                   	ret    
    if(p->s.size >= nunits){
 7de:	89 d0                	mov    %edx,%eax
 7e0:	89 fa                	mov    %edi,%edx
 7e2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
 7e8:	39 ce                	cmp    %ecx,%esi
 7ea:	74 54                	je     840 <malloc+0x100>
        p->s.size -= nunits;
 7ec:	29 f1                	sub    %esi,%ecx
 7ee:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 7f1:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 7f4:	89 70 04             	mov    %esi,0x4(%eax)
      freep = prevp;
 7f7:	89 15 54 0b 00 00    	mov    %edx,0xb54
}
 7fd:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 800:	83 c0 08             	add    $0x8,%eax
}
 803:	5b                   	pop    %ebx
 804:	5e                   	pop    %esi
 805:	5f                   	pop    %edi
 806:	5d                   	pop    %ebp
 807:	c3                   	ret    
 808:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 80f:	90                   	nop
    base.s.ptr = freep = prevp = &base;
 810:	c7 05 54 0b 00 00 58 	movl   $0xb58,0xb54
 817:	0b 00 00 
    base.s.size = 0;
 81a:	bf 58 0b 00 00       	mov    $0xb58,%edi
    base.s.ptr = freep = prevp = &base;
 81f:	c7 05 58 0b 00 00 58 	movl   $0xb58,0xb58
 826:	0b 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 829:	89 fa                	mov    %edi,%edx
    base.s.size = 0;
 82b:	c7 05 5c 0b 00 00 00 	movl   $0x0,0xb5c
 832:	00 00 00 
    if(p->s.size >= nunits){
 835:	e9 32 ff ff ff       	jmp    76c <malloc+0x2c>
 83a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
 840:	8b 08                	mov    (%eax),%ecx
 842:	89 0a                	mov    %ecx,(%edx)
 844:	eb b1                	jmp    7f7 <malloc+0xb7>
