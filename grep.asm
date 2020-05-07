
_grep：     文件格式 elf32-i386


Disassembly of section .text:

00000000 <main>:
  }
}

int
main(int argc, char *argv[])
{
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	pushl  -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	57                   	push   %edi
   e:	56                   	push   %esi
   f:	53                   	push   %ebx
  10:	51                   	push   %ecx
  11:	83 ec 18             	sub    $0x18,%esp
  14:	8b 01                	mov    (%ecx),%eax
  16:	8b 59 04             	mov    0x4(%ecx),%ebx
  19:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  int fd, i;
  char *pattern;

  if(argc <= 1){
  1c:	83 f8 01             	cmp    $0x1,%eax
  1f:	7e 77                	jle    98 <main+0x98>
    printf(2, "usage: grep pattern [file ...]\n");
    exit();
  }
  pattern = argv[1];
  21:	8b 43 04             	mov    0x4(%ebx),%eax
  24:	83 c3 08             	add    $0x8,%ebx

  if(argc <= 2){
  27:	83 7d e4 02          	cmpl   $0x2,-0x1c(%ebp)
    grep(pattern, 0);
    exit();
  }

  for(i = 2; i < argc; i++){
  2b:	be 02 00 00 00       	mov    $0x2,%esi
  pattern = argv[1];
  30:	89 45 e0             	mov    %eax,-0x20(%ebp)
  if(argc <= 2){
  33:	75 35                	jne    6a <main+0x6a>
    grep(pattern, 0);
  35:	52                   	push   %edx
  36:	52                   	push   %edx
  37:	6a 00                	push   $0x0
  39:	50                   	push   %eax
  3a:	e8 f1 01 00 00       	call   230 <grep>
    exit();
  3f:	e8 4d 05 00 00       	call   591 <exit>
  44:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if((fd = open(argv[i], 0)) < 0){
      printf(1, "grep: cannot open %s\n", argv[i]);
      exit();
    }
    grep(pattern, fd);
  48:	83 ec 08             	sub    $0x8,%esp
  for(i = 2; i < argc; i++){
  4b:	83 c6 01             	add    $0x1,%esi
  4e:	83 c3 04             	add    $0x4,%ebx
    grep(pattern, fd);
  51:	50                   	push   %eax
  52:	ff 75 e0             	pushl  -0x20(%ebp)
  55:	e8 d6 01 00 00       	call   230 <grep>
    close(fd);
  5a:	89 3c 24             	mov    %edi,(%esp)
  5d:	e8 57 05 00 00       	call   5b9 <close>
  for(i = 2; i < argc; i++){
  62:	83 c4 10             	add    $0x10,%esp
  65:	39 75 e4             	cmp    %esi,-0x1c(%ebp)
  68:	7e 29                	jle    93 <main+0x93>
    if((fd = open(argv[i], 0)) < 0){
  6a:	83 ec 08             	sub    $0x8,%esp
  6d:	6a 00                	push   $0x0
  6f:	ff 33                	pushl  (%ebx)
  71:	e8 5b 05 00 00       	call   5d1 <open>
  76:	83 c4 10             	add    $0x10,%esp
  79:	89 c7                	mov    %eax,%edi
  7b:	85 c0                	test   %eax,%eax
  7d:	79 c9                	jns    48 <main+0x48>
      printf(1, "grep: cannot open %s\n", argv[i]);
  7f:	50                   	push   %eax
  80:	ff 33                	pushl  (%ebx)
  82:	68 b8 0a 00 00       	push   $0xab8
  87:	6a 01                	push   $0x1
  89:	e8 a2 06 00 00       	call   730 <printf>
      exit();
  8e:	e8 fe 04 00 00       	call   591 <exit>
  }
  exit();
  93:	e8 f9 04 00 00       	call   591 <exit>
    printf(2, "usage: grep pattern [file ...]\n");
  98:	51                   	push   %ecx
  99:	51                   	push   %ecx
  9a:	68 98 0a 00 00       	push   $0xa98
  9f:	6a 02                	push   $0x2
  a1:	e8 8a 06 00 00       	call   730 <printf>
    exit();
  a6:	e8 e6 04 00 00       	call   591 <exit>
  ab:	66 90                	xchg   %ax,%ax
  ad:	66 90                	xchg   %ax,%ax
  af:	90                   	nop

000000b0 <matchstar>:
  return 0;
}

// matchstar: search for c*re at beginning of text
int matchstar(int c, char *re, char *text)
{
  b0:	55                   	push   %ebp
  b1:	89 e5                	mov    %esp,%ebp
  b3:	57                   	push   %edi
  b4:	56                   	push   %esi
  b5:	53                   	push   %ebx
  b6:	83 ec 0c             	sub    $0xc,%esp
  b9:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bc:	8b 75 0c             	mov    0xc(%ebp),%esi
  bf:	8b 7d 10             	mov    0x10(%ebp),%edi
  c2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  do{  // a * matches zero or more instances
    if(matchhere(re, text))
  c8:	83 ec 08             	sub    $0x8,%esp
  cb:	57                   	push   %edi
  cc:	56                   	push   %esi
  cd:	e8 3e 00 00 00       	call   110 <matchhere>
  d2:	83 c4 10             	add    $0x10,%esp
  d5:	85 c0                	test   %eax,%eax
  d7:	75 1f                	jne    f8 <matchstar+0x48>
      return 1;
  }while(*text!='\0' && (*text++==c || c=='.'));
  d9:	0f be 17             	movsbl (%edi),%edx
  dc:	84 d2                	test   %dl,%dl
  de:	74 0c                	je     ec <matchstar+0x3c>
  e0:	83 c7 01             	add    $0x1,%edi
  e3:	39 da                	cmp    %ebx,%edx
  e5:	74 e1                	je     c8 <matchstar+0x18>
  e7:	83 fb 2e             	cmp    $0x2e,%ebx
  ea:	74 dc                	je     c8 <matchstar+0x18>
  return 0;
}
  ec:	8d 65 f4             	lea    -0xc(%ebp),%esp
  ef:	5b                   	pop    %ebx
  f0:	5e                   	pop    %esi
  f1:	5f                   	pop    %edi
  f2:	5d                   	pop    %ebp
  f3:	c3                   	ret    
  f4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  f8:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return 1;
  fb:	b8 01 00 00 00       	mov    $0x1,%eax
}
 100:	5b                   	pop    %ebx
 101:	5e                   	pop    %esi
 102:	5f                   	pop    %edi
 103:	5d                   	pop    %ebp
 104:	c3                   	ret    
 105:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 10c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000110 <matchhere>:
{
 110:	55                   	push   %ebp
 111:	89 e5                	mov    %esp,%ebp
 113:	57                   	push   %edi
 114:	56                   	push   %esi
 115:	53                   	push   %ebx
 116:	83 ec 0c             	sub    $0xc,%esp
  if(re[0] == '\0')
 119:	8b 45 08             	mov    0x8(%ebp),%eax
{
 11c:	8b 7d 0c             	mov    0xc(%ebp),%edi
  if(re[0] == '\0')
 11f:	0f b6 10             	movzbl (%eax),%edx
 122:	84 d2                	test   %dl,%dl
 124:	74 67                	je     18d <matchhere+0x7d>
  if(re[1] == '*')
 126:	0f be 40 01          	movsbl 0x1(%eax),%eax
 12a:	3c 2a                	cmp    $0x2a,%al
 12c:	74 6c                	je     19a <matchhere+0x8a>
  if(re[0] == '$' && re[1] == '\0')
 12e:	0f b6 1f             	movzbl (%edi),%ebx
 131:	80 fa 24             	cmp    $0x24,%dl
 134:	75 08                	jne    13e <matchhere+0x2e>
 136:	84 c0                	test   %al,%al
 138:	0f 84 81 00 00 00    	je     1bf <matchhere+0xaf>
  if(*text!='\0' && (re[0]=='.' || re[0]==*text))
 13e:	84 db                	test   %bl,%bl
 140:	74 09                	je     14b <matchhere+0x3b>
 142:	38 da                	cmp    %bl,%dl
 144:	74 3c                	je     182 <matchhere+0x72>
 146:	80 fa 2e             	cmp    $0x2e,%dl
 149:	74 37                	je     182 <matchhere+0x72>
}
 14b:	8d 65 f4             	lea    -0xc(%ebp),%esp
  return 0;
 14e:	31 c0                	xor    %eax,%eax
}
 150:	5b                   	pop    %ebx
 151:	5e                   	pop    %esi
 152:	5f                   	pop    %edi
 153:	5d                   	pop    %ebp
 154:	c3                   	ret    
 155:	8d 76 00             	lea    0x0(%esi),%esi
  if(re[1] == '*')
 158:	8b 75 08             	mov    0x8(%ebp),%esi
 15b:	0f b6 56 01          	movzbl 0x1(%esi),%edx
 15f:	80 fa 2a             	cmp    $0x2a,%dl
 162:	74 3b                	je     19f <matchhere+0x8f>
  if(re[0] == '$' && re[1] == '\0')
 164:	3c 24                	cmp    $0x24,%al
 166:	75 04                	jne    16c <matchhere+0x5c>
 168:	84 d2                	test   %dl,%dl
 16a:	74 4f                	je     1bb <matchhere+0xab>
  if(*text!='\0' && (re[0]=='.' || re[0]==*text))
 16c:	0f b6 33             	movzbl (%ebx),%esi
 16f:	89 f1                	mov    %esi,%ecx
 171:	84 c9                	test   %cl,%cl
 173:	74 d6                	je     14b <matchhere+0x3b>
 175:	89 df                	mov    %ebx,%edi
 177:	3c 2e                	cmp    $0x2e,%al
 179:	74 04                	je     17f <matchhere+0x6f>
 17b:	38 c1                	cmp    %al,%cl
 17d:	75 cc                	jne    14b <matchhere+0x3b>
 17f:	0f be c2             	movsbl %dl,%eax
    return matchhere(re+1, text+1);
 182:	8d 5f 01             	lea    0x1(%edi),%ebx
 185:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  if(re[0] == '\0')
 189:	84 c0                	test   %al,%al
 18b:	75 cb                	jne    158 <matchhere+0x48>
    return 1;
 18d:	b8 01 00 00 00       	mov    $0x1,%eax
}
 192:	8d 65 f4             	lea    -0xc(%ebp),%esp
 195:	5b                   	pop    %ebx
 196:	5e                   	pop    %esi
 197:	5f                   	pop    %edi
 198:	5d                   	pop    %ebp
 199:	c3                   	ret    
  if(re[1] == '*')
 19a:	89 fb                	mov    %edi,%ebx
 19c:	0f be c2             	movsbl %dl,%eax
    return matchstar(re[0], re+2, text);
 19f:	8b 7d 08             	mov    0x8(%ebp),%edi
 1a2:	83 ec 04             	sub    $0x4,%esp
 1a5:	53                   	push   %ebx
 1a6:	8d 4f 02             	lea    0x2(%edi),%ecx
 1a9:	51                   	push   %ecx
 1aa:	50                   	push   %eax
 1ab:	e8 00 ff ff ff       	call   b0 <matchstar>
 1b0:	83 c4 10             	add    $0x10,%esp
}
 1b3:	8d 65 f4             	lea    -0xc(%ebp),%esp
 1b6:	5b                   	pop    %ebx
 1b7:	5e                   	pop    %esi
 1b8:	5f                   	pop    %edi
 1b9:	5d                   	pop    %ebp
 1ba:	c3                   	ret    
 1bb:	0f b6 5f 01          	movzbl 0x1(%edi),%ebx
    return *text == '\0';
 1bf:	31 c0                	xor    %eax,%eax
 1c1:	84 db                	test   %bl,%bl
 1c3:	0f 94 c0             	sete   %al
 1c6:	eb ca                	jmp    192 <matchhere+0x82>
 1c8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1cf:	90                   	nop

000001d0 <match>:
{
 1d0:	55                   	push   %ebp
 1d1:	89 e5                	mov    %esp,%ebp
 1d3:	56                   	push   %esi
 1d4:	8b 75 08             	mov    0x8(%ebp),%esi
 1d7:	53                   	push   %ebx
 1d8:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  if(re[0] == '^')
 1db:	80 3e 5e             	cmpb   $0x5e,(%esi)
 1de:	75 11                	jne    1f1 <match+0x21>
 1e0:	eb 2e                	jmp    210 <match+0x40>
 1e2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  }while(*text++ != '\0');
 1e8:	83 c3 01             	add    $0x1,%ebx
 1eb:	80 7b ff 00          	cmpb   $0x0,-0x1(%ebx)
 1ef:	74 16                	je     207 <match+0x37>
    if(matchhere(re, text))
 1f1:	83 ec 08             	sub    $0x8,%esp
 1f4:	53                   	push   %ebx
 1f5:	56                   	push   %esi
 1f6:	e8 15 ff ff ff       	call   110 <matchhere>
 1fb:	83 c4 10             	add    $0x10,%esp
 1fe:	85 c0                	test   %eax,%eax
 200:	74 e6                	je     1e8 <match+0x18>
      return 1;
 202:	b8 01 00 00 00       	mov    $0x1,%eax
}
 207:	8d 65 f8             	lea    -0x8(%ebp),%esp
 20a:	5b                   	pop    %ebx
 20b:	5e                   	pop    %esi
 20c:	5d                   	pop    %ebp
 20d:	c3                   	ret    
 20e:	66 90                	xchg   %ax,%ax
    return matchhere(re+1, text);
 210:	83 c6 01             	add    $0x1,%esi
 213:	89 75 08             	mov    %esi,0x8(%ebp)
}
 216:	8d 65 f8             	lea    -0x8(%ebp),%esp
 219:	5b                   	pop    %ebx
 21a:	5e                   	pop    %esi
 21b:	5d                   	pop    %ebp
    return matchhere(re+1, text);
 21c:	e9 ef fe ff ff       	jmp    110 <matchhere>
 221:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 228:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 22f:	90                   	nop

00000230 <grep>:
{
 230:	55                   	push   %ebp
 231:	89 e5                	mov    %esp,%ebp
 233:	57                   	push   %edi
 234:	56                   	push   %esi
 235:	53                   	push   %ebx
 236:	83 ec 1c             	sub    $0x1c,%esp
  m = 0;
 239:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
{
 240:	8b 75 08             	mov    0x8(%ebp),%esi
 243:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 247:	90                   	nop
  while((n = read(fd, buf+m, sizeof(buf)-m-1)) > 0){
 248:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
 24b:	b8 ff 03 00 00       	mov    $0x3ff,%eax
 250:	83 ec 04             	sub    $0x4,%esp
 253:	29 c8                	sub    %ecx,%eax
 255:	50                   	push   %eax
 256:	8d 81 a0 0e 00 00    	lea    0xea0(%ecx),%eax
 25c:	50                   	push   %eax
 25d:	ff 75 0c             	pushl  0xc(%ebp)
 260:	e8 44 03 00 00       	call   5a9 <read>
 265:	83 c4 10             	add    $0x10,%esp
 268:	85 c0                	test   %eax,%eax
 26a:	0f 8e c0 00 00 00    	jle    330 <grep+0x100>
    m += n;
 270:	01 45 e4             	add    %eax,-0x1c(%ebp)
 273:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
    p = buf;
 276:	bb a0 0e 00 00       	mov    $0xea0,%ebx
    buf[m] = '\0';
 27b:	c6 81 a0 0e 00 00 00 	movb   $0x0,0xea0(%ecx)
    while((q = strchr(p, '\n')) != 0){
 282:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 288:	83 ec 08             	sub    $0x8,%esp
 28b:	6a 0a                	push   $0xa
 28d:	53                   	push   %ebx
 28e:	e8 7d 01 00 00       	call   410 <strchr>
 293:	83 c4 10             	add    $0x10,%esp
 296:	89 c7                	mov    %eax,%edi
 298:	85 c0                	test   %eax,%eax
 29a:	74 44                	je     2e0 <grep+0xb0>
      if(match(pattern, p)){
 29c:	83 ec 08             	sub    $0x8,%esp
      *q = 0;
 29f:	c6 07 00             	movb   $0x0,(%edi)
      if(match(pattern, p)){
 2a2:	53                   	push   %ebx
 2a3:	56                   	push   %esi
 2a4:	e8 27 ff ff ff       	call   1d0 <match>
 2a9:	83 c4 10             	add    $0x10,%esp
 2ac:	8d 57 01             	lea    0x1(%edi),%edx
 2af:	85 c0                	test   %eax,%eax
 2b1:	75 0d                	jne    2c0 <grep+0x90>
      p = q+1;
 2b3:	89 d3                	mov    %edx,%ebx
 2b5:	eb d1                	jmp    288 <grep+0x58>
 2b7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 2be:	66 90                	xchg   %ax,%ax
        write(1, p, q+1 - p);
 2c0:	89 d0                	mov    %edx,%eax
 2c2:	83 ec 04             	sub    $0x4,%esp
        *q = '\n';
 2c5:	c6 07 0a             	movb   $0xa,(%edi)
        write(1, p, q+1 - p);
 2c8:	29 d8                	sub    %ebx,%eax
 2ca:	89 55 e0             	mov    %edx,-0x20(%ebp)
 2cd:	50                   	push   %eax
 2ce:	53                   	push   %ebx
 2cf:	6a 01                	push   $0x1
 2d1:	e8 db 02 00 00       	call   5b1 <write>
 2d6:	8b 55 e0             	mov    -0x20(%ebp),%edx
 2d9:	83 c4 10             	add    $0x10,%esp
      p = q+1;
 2dc:	89 d3                	mov    %edx,%ebx
 2de:	eb a8                	jmp    288 <grep+0x58>
    if(p == buf)
 2e0:	81 fb a0 0e 00 00    	cmp    $0xea0,%ebx
 2e6:	74 38                	je     320 <grep+0xf0>
    if(m > 0){
 2e8:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
 2eb:	85 c9                	test   %ecx,%ecx
 2ed:	0f 8e 55 ff ff ff    	jle    248 <grep+0x18>
      m -= p - buf;
 2f3:	89 d8                	mov    %ebx,%eax
      memmove(buf, p, m);
 2f5:	83 ec 04             	sub    $0x4,%esp
      m -= p - buf;
 2f8:	2d a0 0e 00 00       	sub    $0xea0,%eax
 2fd:	29 c1                	sub    %eax,%ecx
      memmove(buf, p, m);
 2ff:	51                   	push   %ecx
 300:	53                   	push   %ebx
 301:	68 a0 0e 00 00       	push   $0xea0
      m -= p - buf;
 306:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
      memmove(buf, p, m);
 309:	e8 52 02 00 00       	call   560 <memmove>
 30e:	83 c4 10             	add    $0x10,%esp
 311:	e9 32 ff ff ff       	jmp    248 <grep+0x18>
 316:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 31d:	8d 76 00             	lea    0x0(%esi),%esi
      m = 0;
 320:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 327:	e9 1c ff ff ff       	jmp    248 <grep+0x18>
 32c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
}
 330:	8d 65 f4             	lea    -0xc(%ebp),%esp
 333:	5b                   	pop    %ebx
 334:	5e                   	pop    %esi
 335:	5f                   	pop    %edi
 336:	5d                   	pop    %ebp
 337:	c3                   	ret    
 338:	66 90                	xchg   %ax,%ax
 33a:	66 90                	xchg   %ax,%ax
 33c:	66 90                	xchg   %ax,%ax
 33e:	66 90                	xchg   %ax,%ax

00000340 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
 340:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 341:	31 d2                	xor    %edx,%edx
{
 343:	89 e5                	mov    %esp,%ebp
 345:	53                   	push   %ebx
 346:	8b 45 08             	mov    0x8(%ebp),%eax
 349:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 34c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((*s++ = *t++) != 0)
 350:	0f b6 0c 13          	movzbl (%ebx,%edx,1),%ecx
 354:	88 0c 10             	mov    %cl,(%eax,%edx,1)
 357:	83 c2 01             	add    $0x1,%edx
 35a:	84 c9                	test   %cl,%cl
 35c:	75 f2                	jne    350 <strcpy+0x10>
    ;
  return os;
}
 35e:	5b                   	pop    %ebx
 35f:	5d                   	pop    %ebp
 360:	c3                   	ret    
 361:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 368:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 36f:	90                   	nop

00000370 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 370:	55                   	push   %ebp
 371:	89 e5                	mov    %esp,%ebp
 373:	56                   	push   %esi
 374:	53                   	push   %ebx
 375:	8b 5d 08             	mov    0x8(%ebp),%ebx
 378:	8b 75 0c             	mov    0xc(%ebp),%esi
  while(*p && *p == *q)
 37b:	0f b6 13             	movzbl (%ebx),%edx
 37e:	0f b6 0e             	movzbl (%esi),%ecx
 381:	84 d2                	test   %dl,%dl
 383:	74 1e                	je     3a3 <strcmp+0x33>
 385:	b8 01 00 00 00       	mov    $0x1,%eax
 38a:	38 ca                	cmp    %cl,%dl
 38c:	74 09                	je     397 <strcmp+0x27>
 38e:	eb 20                	jmp    3b0 <strcmp+0x40>
 390:	83 c0 01             	add    $0x1,%eax
 393:	38 ca                	cmp    %cl,%dl
 395:	75 19                	jne    3b0 <strcmp+0x40>
 397:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
 39b:	0f b6 0c 06          	movzbl (%esi,%eax,1),%ecx
 39f:	84 d2                	test   %dl,%dl
 3a1:	75 ed                	jne    390 <strcmp+0x20>
 3a3:	31 c0                	xor    %eax,%eax
    p++, q++;
  return (uchar)*p - (uchar)*q;
}
 3a5:	5b                   	pop    %ebx
 3a6:	5e                   	pop    %esi
  return (uchar)*p - (uchar)*q;
 3a7:	29 c8                	sub    %ecx,%eax
}
 3a9:	5d                   	pop    %ebp
 3aa:	c3                   	ret    
 3ab:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 3af:	90                   	nop
 3b0:	0f b6 c2             	movzbl %dl,%eax
 3b3:	5b                   	pop    %ebx
 3b4:	5e                   	pop    %esi
  return (uchar)*p - (uchar)*q;
 3b5:	29 c8                	sub    %ecx,%eax
}
 3b7:	5d                   	pop    %ebp
 3b8:	c3                   	ret    
 3b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000003c0 <strlen>:

uint
strlen(const char *s)
{
 3c0:	55                   	push   %ebp
 3c1:	89 e5                	mov    %esp,%ebp
 3c3:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 3c6:	80 39 00             	cmpb   $0x0,(%ecx)
 3c9:	74 15                	je     3e0 <strlen+0x20>
 3cb:	31 d2                	xor    %edx,%edx
 3cd:	8d 76 00             	lea    0x0(%esi),%esi
 3d0:	83 c2 01             	add    $0x1,%edx
 3d3:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
 3d7:	89 d0                	mov    %edx,%eax
 3d9:	75 f5                	jne    3d0 <strlen+0x10>
    ;
  return n;
}
 3db:	5d                   	pop    %ebp
 3dc:	c3                   	ret    
 3dd:	8d 76 00             	lea    0x0(%esi),%esi
  for(n = 0; s[n]; n++)
 3e0:	31 c0                	xor    %eax,%eax
}
 3e2:	5d                   	pop    %ebp
 3e3:	c3                   	ret    
 3e4:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 3eb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 3ef:	90                   	nop

000003f0 <memset>:

void*
memset(void *dst, int c, uint n)
{
 3f0:	55                   	push   %ebp
 3f1:	89 e5                	mov    %esp,%ebp
 3f3:	57                   	push   %edi
 3f4:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 3f7:	8b 4d 10             	mov    0x10(%ebp),%ecx
 3fa:	8b 45 0c             	mov    0xc(%ebp),%eax
 3fd:	89 d7                	mov    %edx,%edi
 3ff:	fc                   	cld    
 400:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 402:	89 d0                	mov    %edx,%eax
 404:	5f                   	pop    %edi
 405:	5d                   	pop    %ebp
 406:	c3                   	ret    
 407:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 40e:	66 90                	xchg   %ax,%ax

00000410 <strchr>:

char*
strchr(const char *s, char c)
{
 410:	55                   	push   %ebp
 411:	89 e5                	mov    %esp,%ebp
 413:	53                   	push   %ebx
 414:	8b 45 08             	mov    0x8(%ebp),%eax
 417:	8b 55 0c             	mov    0xc(%ebp),%edx
  for(; *s; s++)
 41a:	0f b6 18             	movzbl (%eax),%ebx
 41d:	84 db                	test   %bl,%bl
 41f:	74 1d                	je     43e <strchr+0x2e>
 421:	89 d1                	mov    %edx,%ecx
    if(*s == c)
 423:	38 d3                	cmp    %dl,%bl
 425:	75 0d                	jne    434 <strchr+0x24>
 427:	eb 17                	jmp    440 <strchr+0x30>
 429:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 430:	38 ca                	cmp    %cl,%dl
 432:	74 0c                	je     440 <strchr+0x30>
  for(; *s; s++)
 434:	83 c0 01             	add    $0x1,%eax
 437:	0f b6 10             	movzbl (%eax),%edx
 43a:	84 d2                	test   %dl,%dl
 43c:	75 f2                	jne    430 <strchr+0x20>
      return (char*)s;
  return 0;
 43e:	31 c0                	xor    %eax,%eax
}
 440:	5b                   	pop    %ebx
 441:	5d                   	pop    %ebp
 442:	c3                   	ret    
 443:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 44a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000450 <gets>:

char*
gets(char *buf, int max)
{
 450:	55                   	push   %ebp
 451:	89 e5                	mov    %esp,%ebp
 453:	57                   	push   %edi
 454:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 455:	31 f6                	xor    %esi,%esi
{
 457:	53                   	push   %ebx
 458:	89 f3                	mov    %esi,%ebx
 45a:	83 ec 1c             	sub    $0x1c,%esp
 45d:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i=0; i+1 < max; ){
 460:	eb 2f                	jmp    491 <gets+0x41>
 462:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    cc = read(0, &c, 1);
 468:	83 ec 04             	sub    $0x4,%esp
 46b:	8d 45 e7             	lea    -0x19(%ebp),%eax
 46e:	6a 01                	push   $0x1
 470:	50                   	push   %eax
 471:	6a 00                	push   $0x0
 473:	e8 31 01 00 00       	call   5a9 <read>
    if(cc < 1)
 478:	83 c4 10             	add    $0x10,%esp
 47b:	85 c0                	test   %eax,%eax
 47d:	7e 1c                	jle    49b <gets+0x4b>
      break;
    buf[i++] = c;
 47f:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 483:	83 c7 01             	add    $0x1,%edi
 486:	88 47 ff             	mov    %al,-0x1(%edi)
    if(c == '\n' || c == '\r')
 489:	3c 0a                	cmp    $0xa,%al
 48b:	74 23                	je     4b0 <gets+0x60>
 48d:	3c 0d                	cmp    $0xd,%al
 48f:	74 1f                	je     4b0 <gets+0x60>
  for(i=0; i+1 < max; ){
 491:	83 c3 01             	add    $0x1,%ebx
 494:	89 fe                	mov    %edi,%esi
 496:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 499:	7c cd                	jl     468 <gets+0x18>
 49b:	89 f3                	mov    %esi,%ebx
      break;
  }
  buf[i] = '\0';
  return buf;
}
 49d:	8b 45 08             	mov    0x8(%ebp),%eax
  buf[i] = '\0';
 4a0:	c6 03 00             	movb   $0x0,(%ebx)
}
 4a3:	8d 65 f4             	lea    -0xc(%ebp),%esp
 4a6:	5b                   	pop    %ebx
 4a7:	5e                   	pop    %esi
 4a8:	5f                   	pop    %edi
 4a9:	5d                   	pop    %ebp
 4aa:	c3                   	ret    
 4ab:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 4af:	90                   	nop
 4b0:	8b 75 08             	mov    0x8(%ebp),%esi
 4b3:	8b 45 08             	mov    0x8(%ebp),%eax
 4b6:	01 de                	add    %ebx,%esi
 4b8:	89 f3                	mov    %esi,%ebx
  buf[i] = '\0';
 4ba:	c6 03 00             	movb   $0x0,(%ebx)
}
 4bd:	8d 65 f4             	lea    -0xc(%ebp),%esp
 4c0:	5b                   	pop    %ebx
 4c1:	5e                   	pop    %esi
 4c2:	5f                   	pop    %edi
 4c3:	5d                   	pop    %ebp
 4c4:	c3                   	ret    
 4c5:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 4cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000004d0 <stat>:

int
stat(const char *n, struct stat *st)
{
 4d0:	55                   	push   %ebp
 4d1:	89 e5                	mov    %esp,%ebp
 4d3:	56                   	push   %esi
 4d4:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 4d5:	83 ec 08             	sub    $0x8,%esp
 4d8:	6a 00                	push   $0x0
 4da:	ff 75 08             	pushl  0x8(%ebp)
 4dd:	e8 ef 00 00 00       	call   5d1 <open>
  if(fd < 0)
 4e2:	83 c4 10             	add    $0x10,%esp
 4e5:	85 c0                	test   %eax,%eax
 4e7:	78 27                	js     510 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 4e9:	83 ec 08             	sub    $0x8,%esp
 4ec:	ff 75 0c             	pushl  0xc(%ebp)
 4ef:	89 c3                	mov    %eax,%ebx
 4f1:	50                   	push   %eax
 4f2:	e8 f2 00 00 00       	call   5e9 <fstat>
  close(fd);
 4f7:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 4fa:	89 c6                	mov    %eax,%esi
  close(fd);
 4fc:	e8 b8 00 00 00       	call   5b9 <close>
  return r;
 501:	83 c4 10             	add    $0x10,%esp
}
 504:	8d 65 f8             	lea    -0x8(%ebp),%esp
 507:	89 f0                	mov    %esi,%eax
 509:	5b                   	pop    %ebx
 50a:	5e                   	pop    %esi
 50b:	5d                   	pop    %ebp
 50c:	c3                   	ret    
 50d:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 510:	be ff ff ff ff       	mov    $0xffffffff,%esi
 515:	eb ed                	jmp    504 <stat+0x34>
 517:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 51e:	66 90                	xchg   %ax,%ax

00000520 <atoi>:

int
atoi(const char *s)
{
 520:	55                   	push   %ebp
 521:	89 e5                	mov    %esp,%ebp
 523:	53                   	push   %ebx
 524:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 527:	0f be 11             	movsbl (%ecx),%edx
 52a:	8d 42 d0             	lea    -0x30(%edx),%eax
 52d:	3c 09                	cmp    $0x9,%al
  n = 0;
 52f:	b8 00 00 00 00       	mov    $0x0,%eax
  while('0' <= *s && *s <= '9')
 534:	77 1f                	ja     555 <atoi+0x35>
 536:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 53d:	8d 76 00             	lea    0x0(%esi),%esi
    n = n*10 + *s++ - '0';
 540:	83 c1 01             	add    $0x1,%ecx
 543:	8d 04 80             	lea    (%eax,%eax,4),%eax
 546:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
  while('0' <= *s && *s <= '9')
 54a:	0f be 11             	movsbl (%ecx),%edx
 54d:	8d 5a d0             	lea    -0x30(%edx),%ebx
 550:	80 fb 09             	cmp    $0x9,%bl
 553:	76 eb                	jbe    540 <atoi+0x20>
  return n;
}
 555:	5b                   	pop    %ebx
 556:	5d                   	pop    %ebp
 557:	c3                   	ret    
 558:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 55f:	90                   	nop

00000560 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 560:	55                   	push   %ebp
 561:	89 e5                	mov    %esp,%ebp
 563:	57                   	push   %edi
 564:	8b 55 10             	mov    0x10(%ebp),%edx
 567:	8b 45 08             	mov    0x8(%ebp),%eax
 56a:	56                   	push   %esi
 56b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 56e:	85 d2                	test   %edx,%edx
 570:	7e 13                	jle    585 <memmove+0x25>
 572:	01 c2                	add    %eax,%edx
  dst = vdst;
 574:	89 c7                	mov    %eax,%edi
 576:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 57d:	8d 76 00             	lea    0x0(%esi),%esi
    *dst++ = *src++;
 580:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 581:	39 fa                	cmp    %edi,%edx
 583:	75 fb                	jne    580 <memmove+0x20>
  return vdst;
}
 585:	5e                   	pop    %esi
 586:	5f                   	pop    %edi
 587:	5d                   	pop    %ebp
 588:	c3                   	ret    

00000589 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 589:	b8 01 00 00 00       	mov    $0x1,%eax
 58e:	cd 40                	int    $0x40
 590:	c3                   	ret    

00000591 <exit>:
SYSCALL(exit)
 591:	b8 02 00 00 00       	mov    $0x2,%eax
 596:	cd 40                	int    $0x40
 598:	c3                   	ret    

00000599 <wait>:
SYSCALL(wait)
 599:	b8 03 00 00 00       	mov    $0x3,%eax
 59e:	cd 40                	int    $0x40
 5a0:	c3                   	ret    

000005a1 <pipe>:
SYSCALL(pipe)
 5a1:	b8 04 00 00 00       	mov    $0x4,%eax
 5a6:	cd 40                	int    $0x40
 5a8:	c3                   	ret    

000005a9 <read>:
SYSCALL(read)
 5a9:	b8 05 00 00 00       	mov    $0x5,%eax
 5ae:	cd 40                	int    $0x40
 5b0:	c3                   	ret    

000005b1 <write>:
SYSCALL(write)
 5b1:	b8 10 00 00 00       	mov    $0x10,%eax
 5b6:	cd 40                	int    $0x40
 5b8:	c3                   	ret    

000005b9 <close>:
SYSCALL(close)
 5b9:	b8 15 00 00 00       	mov    $0x15,%eax
 5be:	cd 40                	int    $0x40
 5c0:	c3                   	ret    

000005c1 <kill>:
SYSCALL(kill)
 5c1:	b8 06 00 00 00       	mov    $0x6,%eax
 5c6:	cd 40                	int    $0x40
 5c8:	c3                   	ret    

000005c9 <exec>:
SYSCALL(exec)
 5c9:	b8 07 00 00 00       	mov    $0x7,%eax
 5ce:	cd 40                	int    $0x40
 5d0:	c3                   	ret    

000005d1 <open>:
SYSCALL(open)
 5d1:	b8 0f 00 00 00       	mov    $0xf,%eax
 5d6:	cd 40                	int    $0x40
 5d8:	c3                   	ret    

000005d9 <mknod>:
SYSCALL(mknod)
 5d9:	b8 11 00 00 00       	mov    $0x11,%eax
 5de:	cd 40                	int    $0x40
 5e0:	c3                   	ret    

000005e1 <unlink>:
SYSCALL(unlink)
 5e1:	b8 12 00 00 00       	mov    $0x12,%eax
 5e6:	cd 40                	int    $0x40
 5e8:	c3                   	ret    

000005e9 <fstat>:
SYSCALL(fstat)
 5e9:	b8 08 00 00 00       	mov    $0x8,%eax
 5ee:	cd 40                	int    $0x40
 5f0:	c3                   	ret    

000005f1 <link>:
SYSCALL(link)
 5f1:	b8 13 00 00 00       	mov    $0x13,%eax
 5f6:	cd 40                	int    $0x40
 5f8:	c3                   	ret    

000005f9 <mkdir>:
SYSCALL(mkdir)
 5f9:	b8 14 00 00 00       	mov    $0x14,%eax
 5fe:	cd 40                	int    $0x40
 600:	c3                   	ret    

00000601 <chdir>:
SYSCALL(chdir)
 601:	b8 09 00 00 00       	mov    $0x9,%eax
 606:	cd 40                	int    $0x40
 608:	c3                   	ret    

00000609 <dup>:
SYSCALL(dup)
 609:	b8 0a 00 00 00       	mov    $0xa,%eax
 60e:	cd 40                	int    $0x40
 610:	c3                   	ret    

00000611 <getpid>:
SYSCALL(getpid)
 611:	b8 0b 00 00 00       	mov    $0xb,%eax
 616:	cd 40                	int    $0x40
 618:	c3                   	ret    

00000619 <sbrk>:
SYSCALL(sbrk)
 619:	b8 0c 00 00 00       	mov    $0xc,%eax
 61e:	cd 40                	int    $0x40
 620:	c3                   	ret    

00000621 <sleep>:
SYSCALL(sleep)
 621:	b8 0d 00 00 00       	mov    $0xd,%eax
 626:	cd 40                	int    $0x40
 628:	c3                   	ret    

00000629 <uptime>:
SYSCALL(uptime)
 629:	b8 0e 00 00 00       	mov    $0xe,%eax
 62e:	cd 40                	int    $0x40
 630:	c3                   	ret    

00000631 <printingMyFavoriteYear>:
SYSCALL(printingMyFavoriteYear)
 631:	b8 16 00 00 00       	mov    $0x16,%eax
 636:	cd 40                	int    $0x40
 638:	c3                   	ret    

00000639 <getChildren>:
SYSCALL(getChildren)
 639:	b8 17 00 00 00       	mov    $0x17,%eax
 63e:	cd 40                	int    $0x40
 640:	c3                   	ret    

00000641 <getRunningProcessPID>:
SYSCALL(getRunningProcessPID)
 641:	b8 18 00 00 00       	mov    $0x18,%eax
 646:	cd 40                	int    $0x40
 648:	c3                   	ret    

00000649 <changePolicy>:
SYSCALL(changePolicy)
 649:	b8 19 00 00 00       	mov    $0x19,%eax
 64e:	cd 40                	int    $0x40
 650:	c3                   	ret    

00000651 <Quantum_Increaser>:
SYSCALL(Quantum_Increaser)
 651:	b8 1a 00 00 00       	mov    $0x1a,%eax
 656:	cd 40                	int    $0x40
 658:	c3                   	ret    

00000659 <Quantum_Decreaser>:
SYSCALL(Quantum_Decreaser)
 659:	b8 1b 00 00 00       	mov    $0x1b,%eax
 65e:	cd 40                	int    $0x40
 660:	c3                   	ret    
 661:	66 90                	xchg   %ax,%ax
 663:	66 90                	xchg   %ax,%ax
 665:	66 90                	xchg   %ax,%ax
 667:	66 90                	xchg   %ax,%ax
 669:	66 90                	xchg   %ax,%ax
 66b:	66 90                	xchg   %ax,%ax
 66d:	66 90                	xchg   %ax,%ax
 66f:	90                   	nop

00000670 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 670:	55                   	push   %ebp
 671:	89 e5                	mov    %esp,%ebp
 673:	57                   	push   %edi
 674:	56                   	push   %esi
 675:	53                   	push   %ebx
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 676:	89 d3                	mov    %edx,%ebx
{
 678:	83 ec 3c             	sub    $0x3c,%esp
 67b:	89 45 bc             	mov    %eax,-0x44(%ebp)
  if(sgn && xx < 0){
 67e:	85 d2                	test   %edx,%edx
 680:	0f 89 92 00 00 00    	jns    718 <printint+0xa8>
 686:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 68a:	0f 84 88 00 00 00    	je     718 <printint+0xa8>
    neg = 1;
 690:	c7 45 c0 01 00 00 00 	movl   $0x1,-0x40(%ebp)
    x = -xx;
 697:	f7 db                	neg    %ebx
  } else {
    x = xx;
  }

  i = 0;
 699:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
 6a0:	8d 75 d7             	lea    -0x29(%ebp),%esi
 6a3:	eb 08                	jmp    6ad <printint+0x3d>
 6a5:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 6a8:	89 7d c4             	mov    %edi,-0x3c(%ebp)
  }while((x /= base) != 0);
 6ab:	89 c3                	mov    %eax,%ebx
    buf[i++] = digits[x % base];
 6ad:	89 d8                	mov    %ebx,%eax
 6af:	31 d2                	xor    %edx,%edx
 6b1:	8b 7d c4             	mov    -0x3c(%ebp),%edi
 6b4:	f7 f1                	div    %ecx
 6b6:	83 c7 01             	add    $0x1,%edi
 6b9:	0f b6 92 d8 0a 00 00 	movzbl 0xad8(%edx),%edx
 6c0:	88 14 3e             	mov    %dl,(%esi,%edi,1)
  }while((x /= base) != 0);
 6c3:	39 d9                	cmp    %ebx,%ecx
 6c5:	76 e1                	jbe    6a8 <printint+0x38>
  if(neg)
 6c7:	8b 45 c0             	mov    -0x40(%ebp),%eax
 6ca:	85 c0                	test   %eax,%eax
 6cc:	74 0d                	je     6db <printint+0x6b>
    buf[i++] = '-';
 6ce:	c6 44 3d d8 2d       	movb   $0x2d,-0x28(%ebp,%edi,1)
 6d3:	ba 2d 00 00 00       	mov    $0x2d,%edx
    buf[i++] = digits[x % base];
 6d8:	89 7d c4             	mov    %edi,-0x3c(%ebp)
 6db:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 6de:	8b 7d bc             	mov    -0x44(%ebp),%edi
 6e1:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
 6e5:	eb 0f                	jmp    6f6 <printint+0x86>
 6e7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 6ee:	66 90                	xchg   %ax,%ax
 6f0:	0f b6 13             	movzbl (%ebx),%edx
 6f3:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
 6f6:	83 ec 04             	sub    $0x4,%esp
 6f9:	88 55 d7             	mov    %dl,-0x29(%ebp)
 6fc:	6a 01                	push   $0x1
 6fe:	56                   	push   %esi
 6ff:	57                   	push   %edi
 700:	e8 ac fe ff ff       	call   5b1 <write>

  while(--i >= 0)
 705:	83 c4 10             	add    $0x10,%esp
 708:	39 de                	cmp    %ebx,%esi
 70a:	75 e4                	jne    6f0 <printint+0x80>
    putc(fd, buf[i]);
}
 70c:	8d 65 f4             	lea    -0xc(%ebp),%esp
 70f:	5b                   	pop    %ebx
 710:	5e                   	pop    %esi
 711:	5f                   	pop    %edi
 712:	5d                   	pop    %ebp
 713:	c3                   	ret    
 714:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 718:	c7 45 c0 00 00 00 00 	movl   $0x0,-0x40(%ebp)
 71f:	e9 75 ff ff ff       	jmp    699 <printint+0x29>
 724:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 72b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 72f:	90                   	nop

00000730 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 730:	55                   	push   %ebp
 731:	89 e5                	mov    %esp,%ebp
 733:	57                   	push   %edi
 734:	56                   	push   %esi
 735:	53                   	push   %ebx
 736:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 739:	8b 75 0c             	mov    0xc(%ebp),%esi
 73c:	0f b6 1e             	movzbl (%esi),%ebx
 73f:	84 db                	test   %bl,%bl
 741:	0f 84 b9 00 00 00    	je     800 <printf+0xd0>
  ap = (uint*)(void*)&fmt + 1;
 747:	8d 45 10             	lea    0x10(%ebp),%eax
 74a:	83 c6 01             	add    $0x1,%esi
  write(fd, &c, 1);
 74d:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
 750:	31 d2                	xor    %edx,%edx
  ap = (uint*)(void*)&fmt + 1;
 752:	89 45 d0             	mov    %eax,-0x30(%ebp)
 755:	eb 38                	jmp    78f <printf+0x5f>
 757:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 75e:	66 90                	xchg   %ax,%ax
 760:	89 55 d4             	mov    %edx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 763:	ba 25 00 00 00       	mov    $0x25,%edx
      if(c == '%'){
 768:	83 f8 25             	cmp    $0x25,%eax
 76b:	74 17                	je     784 <printf+0x54>
  write(fd, &c, 1);
 76d:	83 ec 04             	sub    $0x4,%esp
 770:	88 5d e7             	mov    %bl,-0x19(%ebp)
 773:	6a 01                	push   $0x1
 775:	57                   	push   %edi
 776:	ff 75 08             	pushl  0x8(%ebp)
 779:	e8 33 fe ff ff       	call   5b1 <write>
 77e:	8b 55 d4             	mov    -0x2c(%ebp),%edx
      } else {
        putc(fd, c);
 781:	83 c4 10             	add    $0x10,%esp
 784:	83 c6 01             	add    $0x1,%esi
  for(i = 0; fmt[i]; i++){
 787:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
 78b:	84 db                	test   %bl,%bl
 78d:	74 71                	je     800 <printf+0xd0>
    c = fmt[i] & 0xff;
 78f:	0f be cb             	movsbl %bl,%ecx
 792:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
 795:	85 d2                	test   %edx,%edx
 797:	74 c7                	je     760 <printf+0x30>
      }
    } else if(state == '%'){
 799:	83 fa 25             	cmp    $0x25,%edx
 79c:	75 e6                	jne    784 <printf+0x54>
      if(c == 'd'){
 79e:	83 f8 64             	cmp    $0x64,%eax
 7a1:	0f 84 99 00 00 00    	je     840 <printf+0x110>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 7a7:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
 7ad:	83 f9 70             	cmp    $0x70,%ecx
 7b0:	74 5e                	je     810 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 7b2:	83 f8 73             	cmp    $0x73,%eax
 7b5:	0f 84 d5 00 00 00    	je     890 <printf+0x160>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 7bb:	83 f8 63             	cmp    $0x63,%eax
 7be:	0f 84 8c 00 00 00    	je     850 <printf+0x120>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 7c4:	83 f8 25             	cmp    $0x25,%eax
 7c7:	0f 84 b3 00 00 00    	je     880 <printf+0x150>
  write(fd, &c, 1);
 7cd:	83 ec 04             	sub    $0x4,%esp
 7d0:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 7d4:	6a 01                	push   $0x1
 7d6:	57                   	push   %edi
 7d7:	ff 75 08             	pushl  0x8(%ebp)
 7da:	e8 d2 fd ff ff       	call   5b1 <write>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
 7df:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
 7e2:	83 c4 0c             	add    $0xc,%esp
 7e5:	6a 01                	push   $0x1
 7e7:	83 c6 01             	add    $0x1,%esi
 7ea:	57                   	push   %edi
 7eb:	ff 75 08             	pushl  0x8(%ebp)
 7ee:	e8 be fd ff ff       	call   5b1 <write>
  for(i = 0; fmt[i]; i++){
 7f3:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
        putc(fd, c);
 7f7:	83 c4 10             	add    $0x10,%esp
      }
      state = 0;
 7fa:	31 d2                	xor    %edx,%edx
  for(i = 0; fmt[i]; i++){
 7fc:	84 db                	test   %bl,%bl
 7fe:	75 8f                	jne    78f <printf+0x5f>
    }
  }
}
 800:	8d 65 f4             	lea    -0xc(%ebp),%esp
 803:	5b                   	pop    %ebx
 804:	5e                   	pop    %esi
 805:	5f                   	pop    %edi
 806:	5d                   	pop    %ebp
 807:	c3                   	ret    
 808:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 80f:	90                   	nop
        printint(fd, *ap, 16, 0);
 810:	83 ec 0c             	sub    $0xc,%esp
 813:	b9 10 00 00 00       	mov    $0x10,%ecx
 818:	6a 00                	push   $0x0
 81a:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 81d:	8b 45 08             	mov    0x8(%ebp),%eax
 820:	8b 13                	mov    (%ebx),%edx
 822:	e8 49 fe ff ff       	call   670 <printint>
        ap++;
 827:	89 d8                	mov    %ebx,%eax
 829:	83 c4 10             	add    $0x10,%esp
      state = 0;
 82c:	31 d2                	xor    %edx,%edx
        ap++;
 82e:	83 c0 04             	add    $0x4,%eax
 831:	89 45 d0             	mov    %eax,-0x30(%ebp)
 834:	e9 4b ff ff ff       	jmp    784 <printf+0x54>
 839:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        printint(fd, *ap, 10, 1);
 840:	83 ec 0c             	sub    $0xc,%esp
 843:	b9 0a 00 00 00       	mov    $0xa,%ecx
 848:	6a 01                	push   $0x1
 84a:	eb ce                	jmp    81a <printf+0xea>
 84c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        putc(fd, *ap);
 850:	8b 5d d0             	mov    -0x30(%ebp),%ebx
  write(fd, &c, 1);
 853:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
 856:	8b 03                	mov    (%ebx),%eax
  write(fd, &c, 1);
 858:	6a 01                	push   $0x1
        ap++;
 85a:	83 c3 04             	add    $0x4,%ebx
  write(fd, &c, 1);
 85d:	57                   	push   %edi
 85e:	ff 75 08             	pushl  0x8(%ebp)
        putc(fd, *ap);
 861:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 864:	e8 48 fd ff ff       	call   5b1 <write>
        ap++;
 869:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 86c:	83 c4 10             	add    $0x10,%esp
      state = 0;
 86f:	31 d2                	xor    %edx,%edx
 871:	e9 0e ff ff ff       	jmp    784 <printf+0x54>
 876:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 87d:	8d 76 00             	lea    0x0(%esi),%esi
        putc(fd, c);
 880:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
 883:	83 ec 04             	sub    $0x4,%esp
 886:	e9 5a ff ff ff       	jmp    7e5 <printf+0xb5>
 88b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 88f:	90                   	nop
        s = (char*)*ap;
 890:	8b 45 d0             	mov    -0x30(%ebp),%eax
 893:	8b 18                	mov    (%eax),%ebx
        ap++;
 895:	83 c0 04             	add    $0x4,%eax
 898:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 89b:	85 db                	test   %ebx,%ebx
 89d:	74 17                	je     8b6 <printf+0x186>
        while(*s != 0){
 89f:	0f b6 03             	movzbl (%ebx),%eax
      state = 0;
 8a2:	31 d2                	xor    %edx,%edx
        while(*s != 0){
 8a4:	84 c0                	test   %al,%al
 8a6:	0f 84 d8 fe ff ff    	je     784 <printf+0x54>
 8ac:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 8af:	89 de                	mov    %ebx,%esi
 8b1:	8b 5d 08             	mov    0x8(%ebp),%ebx
 8b4:	eb 1a                	jmp    8d0 <printf+0x1a0>
          s = "(null)";
 8b6:	bb ce 0a 00 00       	mov    $0xace,%ebx
        while(*s != 0){
 8bb:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 8be:	b8 28 00 00 00       	mov    $0x28,%eax
 8c3:	89 de                	mov    %ebx,%esi
 8c5:	8b 5d 08             	mov    0x8(%ebp),%ebx
 8c8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 8cf:	90                   	nop
  write(fd, &c, 1);
 8d0:	83 ec 04             	sub    $0x4,%esp
          s++;
 8d3:	83 c6 01             	add    $0x1,%esi
 8d6:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 8d9:	6a 01                	push   $0x1
 8db:	57                   	push   %edi
 8dc:	53                   	push   %ebx
 8dd:	e8 cf fc ff ff       	call   5b1 <write>
        while(*s != 0){
 8e2:	0f b6 06             	movzbl (%esi),%eax
 8e5:	83 c4 10             	add    $0x10,%esp
 8e8:	84 c0                	test   %al,%al
 8ea:	75 e4                	jne    8d0 <printf+0x1a0>
 8ec:	8b 75 d4             	mov    -0x2c(%ebp),%esi
      state = 0;
 8ef:	31 d2                	xor    %edx,%edx
 8f1:	e9 8e fe ff ff       	jmp    784 <printf+0x54>
 8f6:	66 90                	xchg   %ax,%ax
 8f8:	66 90                	xchg   %ax,%ax
 8fa:	66 90                	xchg   %ax,%ax
 8fc:	66 90                	xchg   %ax,%ax
 8fe:	66 90                	xchg   %ax,%ax

00000900 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 900:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 901:	a1 80 0e 00 00       	mov    0xe80,%eax
{
 906:	89 e5                	mov    %esp,%ebp
 908:	57                   	push   %edi
 909:	56                   	push   %esi
 90a:	53                   	push   %ebx
 90b:	8b 5d 08             	mov    0x8(%ebp),%ebx
 90e:	8b 10                	mov    (%eax),%edx
  bp = (Header*)ap - 1;
 910:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 913:	39 c8                	cmp    %ecx,%eax
 915:	73 19                	jae    930 <free+0x30>
 917:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 91e:	66 90                	xchg   %ax,%ax
 920:	39 d1                	cmp    %edx,%ecx
 922:	72 14                	jb     938 <free+0x38>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 924:	39 d0                	cmp    %edx,%eax
 926:	73 10                	jae    938 <free+0x38>
{
 928:	89 d0                	mov    %edx,%eax
 92a:	8b 10                	mov    (%eax),%edx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 92c:	39 c8                	cmp    %ecx,%eax
 92e:	72 f0                	jb     920 <free+0x20>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 930:	39 d0                	cmp    %edx,%eax
 932:	72 f4                	jb     928 <free+0x28>
 934:	39 d1                	cmp    %edx,%ecx
 936:	73 f0                	jae    928 <free+0x28>
      break;
  if(bp + bp->s.size == p->s.ptr){
 938:	8b 73 fc             	mov    -0x4(%ebx),%esi
 93b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 93e:	39 fa                	cmp    %edi,%edx
 940:	74 1e                	je     960 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 942:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 945:	8b 50 04             	mov    0x4(%eax),%edx
 948:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 94b:	39 f1                	cmp    %esi,%ecx
 94d:	74 28                	je     977 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 94f:	89 08                	mov    %ecx,(%eax)
  freep = p;
}
 951:	5b                   	pop    %ebx
  freep = p;
 952:	a3 80 0e 00 00       	mov    %eax,0xe80
}
 957:	5e                   	pop    %esi
 958:	5f                   	pop    %edi
 959:	5d                   	pop    %ebp
 95a:	c3                   	ret    
 95b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 95f:	90                   	nop
    bp->s.size += p->s.ptr->s.size;
 960:	03 72 04             	add    0x4(%edx),%esi
 963:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 966:	8b 10                	mov    (%eax),%edx
 968:	8b 12                	mov    (%edx),%edx
 96a:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 96d:	8b 50 04             	mov    0x4(%eax),%edx
 970:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 973:	39 f1                	cmp    %esi,%ecx
 975:	75 d8                	jne    94f <free+0x4f>
    p->s.size += bp->s.size;
 977:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
 97a:	a3 80 0e 00 00       	mov    %eax,0xe80
    p->s.size += bp->s.size;
 97f:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 982:	8b 53 f8             	mov    -0x8(%ebx),%edx
 985:	89 10                	mov    %edx,(%eax)
}
 987:	5b                   	pop    %ebx
 988:	5e                   	pop    %esi
 989:	5f                   	pop    %edi
 98a:	5d                   	pop    %ebp
 98b:	c3                   	ret    
 98c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000990 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 990:	55                   	push   %ebp
 991:	89 e5                	mov    %esp,%ebp
 993:	57                   	push   %edi
 994:	56                   	push   %esi
 995:	53                   	push   %ebx
 996:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 999:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 99c:	8b 3d 80 0e 00 00    	mov    0xe80,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 9a2:	8d 70 07             	lea    0x7(%eax),%esi
 9a5:	c1 ee 03             	shr    $0x3,%esi
 9a8:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
 9ab:	85 ff                	test   %edi,%edi
 9ad:	0f 84 ad 00 00 00    	je     a60 <malloc+0xd0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 9b3:	8b 17                	mov    (%edi),%edx
    if(p->s.size >= nunits){
 9b5:	8b 4a 04             	mov    0x4(%edx),%ecx
 9b8:	39 f1                	cmp    %esi,%ecx
 9ba:	73 72                	jae    a2e <malloc+0x9e>
 9bc:	81 fe 00 10 00 00    	cmp    $0x1000,%esi
 9c2:	bb 00 10 00 00       	mov    $0x1000,%ebx
 9c7:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
 9ca:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 9d1:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 9d4:	eb 1b                	jmp    9f1 <malloc+0x61>
 9d6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 9dd:	8d 76 00             	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 9e0:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 9e2:	8b 48 04             	mov    0x4(%eax),%ecx
 9e5:	39 f1                	cmp    %esi,%ecx
 9e7:	73 4f                	jae    a38 <malloc+0xa8>
 9e9:	8b 3d 80 0e 00 00    	mov    0xe80,%edi
 9ef:	89 c2                	mov    %eax,%edx
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 9f1:	39 d7                	cmp    %edx,%edi
 9f3:	75 eb                	jne    9e0 <malloc+0x50>
  p = sbrk(nu * sizeof(Header));
 9f5:	83 ec 0c             	sub    $0xc,%esp
 9f8:	ff 75 e4             	pushl  -0x1c(%ebp)
 9fb:	e8 19 fc ff ff       	call   619 <sbrk>
  if(p == (char*)-1)
 a00:	83 c4 10             	add    $0x10,%esp
 a03:	83 f8 ff             	cmp    $0xffffffff,%eax
 a06:	74 1c                	je     a24 <malloc+0x94>
  hp->s.size = nu;
 a08:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 a0b:	83 ec 0c             	sub    $0xc,%esp
 a0e:	83 c0 08             	add    $0x8,%eax
 a11:	50                   	push   %eax
 a12:	e8 e9 fe ff ff       	call   900 <free>
  return freep;
 a17:	8b 15 80 0e 00 00    	mov    0xe80,%edx
      if((p = morecore(nunits)) == 0)
 a1d:	83 c4 10             	add    $0x10,%esp
 a20:	85 d2                	test   %edx,%edx
 a22:	75 bc                	jne    9e0 <malloc+0x50>
        return 0;
  }
}
 a24:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 a27:	31 c0                	xor    %eax,%eax
}
 a29:	5b                   	pop    %ebx
 a2a:	5e                   	pop    %esi
 a2b:	5f                   	pop    %edi
 a2c:	5d                   	pop    %ebp
 a2d:	c3                   	ret    
    if(p->s.size >= nunits){
 a2e:	89 d0                	mov    %edx,%eax
 a30:	89 fa                	mov    %edi,%edx
 a32:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
 a38:	39 ce                	cmp    %ecx,%esi
 a3a:	74 54                	je     a90 <malloc+0x100>
        p->s.size -= nunits;
 a3c:	29 f1                	sub    %esi,%ecx
 a3e:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 a41:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 a44:	89 70 04             	mov    %esi,0x4(%eax)
      freep = prevp;
 a47:	89 15 80 0e 00 00    	mov    %edx,0xe80
}
 a4d:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 a50:	83 c0 08             	add    $0x8,%eax
}
 a53:	5b                   	pop    %ebx
 a54:	5e                   	pop    %esi
 a55:	5f                   	pop    %edi
 a56:	5d                   	pop    %ebp
 a57:	c3                   	ret    
 a58:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 a5f:	90                   	nop
    base.s.ptr = freep = prevp = &base;
 a60:	c7 05 80 0e 00 00 84 	movl   $0xe84,0xe80
 a67:	0e 00 00 
    base.s.size = 0;
 a6a:	bf 84 0e 00 00       	mov    $0xe84,%edi
    base.s.ptr = freep = prevp = &base;
 a6f:	c7 05 84 0e 00 00 84 	movl   $0xe84,0xe84
 a76:	0e 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 a79:	89 fa                	mov    %edi,%edx
    base.s.size = 0;
 a7b:	c7 05 88 0e 00 00 00 	movl   $0x0,0xe88
 a82:	00 00 00 
    if(p->s.size >= nunits){
 a85:	e9 32 ff ff ff       	jmp    9bc <malloc+0x2c>
 a8a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
 a90:	8b 08                	mov    (%eax),%ecx
 a92:	89 0a                	mov    %ecx,(%edx)
 a94:	eb b1                	jmp    a47 <malloc+0xb7>
