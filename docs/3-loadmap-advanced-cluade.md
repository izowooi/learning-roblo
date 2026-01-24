# 로블록스 중급~고급 개발자를 위한 학습 로드맵

Core 커리큘럼을 완료하고 Rojo, Aftman 등 전문 개발 환경을 구축한 개발자를 위한 다음 단계 학습 자료입니다. **공식 문서의 고급 커리큘럼 → 전문 워크플로우 도구 → 프레임워크 & 아키텍처 → 고급 시스템** 순서로 학습하는 것을 권장합니다. 대부분의 자료는 영어이지만, 로블록스 공식 문서는 한국어 번역을 제공합니다.

---

## 공식 고급 커리큘럼: Core 이후의 필수 학습 경로

로블록스는 Core 커리큘럼 이후 **Gameplay Scripting**과 **Environmental Art** 두 가지 심화 커리큘럼을 제공합니다. 둘 다 1인칭 레이저 태그 게임을 완성하는 프로젝트 기반 학습입니다.

### Gameplay Scripting 커리큘럼 (고급)
| 항목 | 내용 |
|------|------|
| **URL** | https://create.roblox.com/docs/tutorials/curriculums/gameplay-scripting |
| **난이도** | 고급 (중급 이상 스크립터 대상) |
| **소요 시간** | 10-15시간 |
| **주요 학습** | 스폰/리스폰 시스템, PlayerStates 구현, 클라이언트-서버 통신 패턴, 전투 시스템(BlastData), 충돌 감지, 체력 시스템 |
| **실습 파일** | Laser Tag (Place ID: 14817965191) - 복사 가능 |

### Environmental Art 커리큘럼 (중급-고급)
| 항목 | 내용 |
|------|------|
| **URL** | https://create.roblox.com/docs/tutorials/curriculums/environmental-art |
| **한국어** | https://create.roblox.com/docs/ko-kr/tutorials/curriculums/environmental-art |
| **난이도** | 중급-고급 |
| **소요 시간** | 15-20시간 |
| **주요 학습** | 레벨 디자인, 그레이박싱, 타일러블 텍스처, 모듈러 건축 키트, 지형 조각, MicroProfiler를 활용한 **성능 최적화** |

### 공식 쇼케이스 프로젝트
고급 기법을 실제로 적용한 공식 예제들입니다:

- **The Mystery of Duvall Drive**: https://create.roblox.com/docs/resources/the-mystery-of-duvall-drive (환경 구축, 오디오 디자인)
- **Beyond the Dark**: https://create.roblox.com/docs/resources/beyond-the-dark (우주 정거장 환경, 스케치에서 3D까지)
- **고급 템플릿**: https://create.roblox.com/docs/resources/templates (Laser Tag, FPS System, Racing 등)

---

## 전문 개발 워크플로우 도구 마스터하기

이미 Rojo와 Aftman을 설치했다면, 다음 단계는 이 도구들의 **고급 활용법**과 추가 도구들을 익히는 것입니다.

### Rojo 고급 활용
| 자료 | URL | 설명 |
|------|-----|------|
| **공식 문서 (v7)** | https://rojo.space/docs/v7/ | 프로젝트 포맷, 워크플로우 베스트 프랙티스 |
| **Workflows 가이드** | https://rojo.space/docs/v7/workflows/ | 팀 협업, CI/CD 통합 패턴 |
| **DevForum 튜토리얼** | https://devforum.roblox.com/t/how-to-setup-and-use-rojo/3806285 | 실전 설정 가이드 |

**필수 VS Code 확장**: luau-lsp (인텔리센스), StyLua (포맷팅), Selene (린팅), roblox-ui (프로젝트 시각화)

### roblox-ts: TypeScript로 로블록스 개발
TypeScript의 타입 안전성을 원한다면 roblox-ts가 강력한 선택입니다. 학습 곡선이 있지만, 대규모 프로젝트에서 유지보수성이 크게 향상됩니다.

| 자료 | URL | 난이도 |
|------|-----|--------|
| **공식 문서** | https://roblox-ts.com/docs/ | 중급-고급 |
| **Quick Start** | https://roblox-ts.com/docs/quick-start | 중급 |
| **Rojo 연동 가이드** | https://roblox-ts.com/docs/guides/syncing-with-rojo | 중급 |
| **Discord 커뮤니티** | https://discord.roblox-ts.com | - |

### 패키지 매니저 활용

**Wally** (Roblox용 npm/Cargo)
| 항목 | 내용 |
|------|------|
| **공식 사이트** | https://wally.run/ |
| **GitHub** | https://github.com/UpliftGames/wally |
| **DevForum 가이드** | https://devforum.roblox.com/t/how-to-install-wally/1757494 |
| **주요 기능** | wally.toml 기반 의존성 관리, shared/server/dev 영역 구분, lockfile 지원 |

**Lune** (스탠드얼론 Luau 런타임) - 빌드 스크립트, CI/CD, 테스트 자동화에 활용
| 항목 | 내용 |
|------|------|
| **공식 문서** | https://lune-org.github.io/docs/ |
| **GitHub** | https://github.com/lune-org/lune |
| **활용** | 파일시스템 조작, .rbxl/.rbxm 파일 처리, 자동화 스크립트 |

**Rokit** (차세대 툴체인 매니저) - Aftman의 후계자로, 더 빠른 설치와 나은 호환성 제공
| 항목 | 내용 |
|------|------|
| **GitHub** | https://github.com/rojo-rbx/rokit |
| **특징** | foreman.toml/aftman.toml 호환, 커뮤니티 주도 개발 |

### CI/CD 및 버전 관리
| 자료 | URL | 설명 |
|------|-----|------|
| **Roblox CI/CD 데모** | https://github.com/Roblox/place-ci-cd-demo | 공식 GitHub Actions 예제 |
| **Mantle 배포 도구** | https://mantledeploy.vercel.app/docs/continuous-deployment | 자동 배포 파이프라인 |
| **TestEZ** | https://github.com/Roblox/testez | 로블록스 공식 테스팅 프레임워크 |

---

## 프레임워크 및 아키텍처 패턴

코드베이스가 커지면 체계적인 구조가 필수입니다. 프레임워크 선택은 **언어(Luau vs TypeScript)**와 **프로젝트 규모**에 따라 달라집니다.

### Knit 프레임워크 (Luau, 입문 추천)
가장 접근성이 좋은 프레임워크로, 서비스/컨트롤러 패턴과 자동 네트워킹을 제공합니다.

| 항목 | 내용 |
|------|------|
| **공식 문서** | https://sleitnick.github.io/Knit/ |
| **GitHub** | https://github.com/Sleitnick/Knit |
| **Wally 설치** | `Knit = "sleitnick/knit@^1.7"` |
| **난이도** | 중급 |
| **적합한 프로젝트** | 소규모-중규모, 솔로 또는 소규모 팀 |
| **주요 기능** | RemoteEvent 추상화, Promise 기반 비동기, 자동 클라이언트-서버 연결 |

### Flamework (TypeScript, 대규모 프로젝트)
roblox-ts와 함께 사용하는 고급 프레임워크로, **타입 안전 네트워킹**과 **의존성 주입**을 제공합니다.

| 항목 | 내용 |
|------|------|
| **공식 문서** | https://flamework.fireboltofdeath.dev/ |
| **GitHub** | https://github.com/rbxts-flamework/core |
| **템플릿** | https://github.com/MonzterDev/Roblox-TS-Template (ProfileService, React, TestEZ 포함) |
| **난이도** | 고급 |
| **적합한 프로젝트** | 중규모-대규모, 타입 안전성 중시 |

### Matter ECS (데이터 지향 설계)
많은 엔티티가 유사한 동작을 공유하는 게임(예: 시뮬레이터, 타워 디펜스)에 적합한 **Entity-Component-System** 아키텍처입니다.

| 항목 | 내용 |
|------|------|
| **공식 문서** | https://matter-ecs.github.io/matter/ |
| **GitHub** | https://github.com/matter-ecs/matter |
| **DevForum 가이드** | "All about Entity Component System" by Ukendio |
| **난이도** | 고급 |
| **장점** | OOP 상속 문제 해결, 동적 컴포넌트 추가/제거, 내장 디버거 |

**Jecs** (https://github.com/Ukendio/jecs) - Matter보다 빠른 쿼리 성능, 엔티티 관계 그래프 지원

### Nevermore Engine (270+ 유틸리티 패키지)
완전한 프레임워크보다는 필요한 유틸리티만 선택적으로 사용할 수 있는 라이브러리 모음입니다.

| 항목 | 내용 |
|------|------|
| **공식 문서** | https://quenty.github.io/NevermoreEngine/ |
| **GitHub** | https://github.com/Quenty/NevermoreEngine |
| **주요 패키지** | IK, Ragdoll, 카메라 시스템, DataStore 래퍼, Spring 물리 |

### 프레임워크 선택 가이드
| 상황 | 추천 |
|------|------|
| 첫 프레임워크 학습 | **Knit** (낮은 진입 장벽) |
| TypeScript 사용 | **Flamework** + Matter |
| 많은 엔티티 게임 | **Matter** 또는 **Jecs** |
| 특정 기능만 필요 | **Nevermore** 패키지 선택적 사용 |

### 아키텍처 패턴 학습 자료
- **MVC 패턴**: https://devforum.roblox.com/t/mvc-a-practical-approach-towards-developing-games/3026159
- **Single-Script 아키텍처**: https://medium.com/roblox-development/this-article-was-originally-published-in-them-magazines-de995382e352
- **Game Programming Patterns (책)**: http://www.gameprogrammingpatterns.com/ (무료 온라인)

---

## 고급 시스템 구현

### 네트워킹 최적화
기본 RemoteEvent는 비효율적입니다. **BridgeNet2**는 패킷당 7바이트 헤더를 절약하고 75-80% 빠른 처리 속도를 제공합니다.

| 자료 | URL | 설명 |
|------|-----|------|
| **BridgeNet2** | https://github.com/ffrostfall/BridgeNet2 | 고성능 네트워킹 라이브러리 |
| **DevForum 소개** | https://devforum.roblox.com/t/bridgenet2-v100/2189165 | 설치 및 사용법 |
| **공식 Remote 문서** | https://create.roblox.com/docs/scripting/events/remote | 기초 이해 필수 |

### 데이터 관리: ProfileService → ProfileStore
**ProfileStore**는 ProfileService의 후속작으로, 새 프로젝트에는 이것을 사용하세요.

| 자료 | URL | 핵심 기능 |
|------|-----|----------|
| **ProfileStore (신규 권장)** | https://devforum.roblox.com/t/profilestore/3190543 | 세션 잠금, 자동 저장, 간소화된 API |
| **ProfileService 문서** | https://madstudioroblox.github.io/ProfileService/ | 레거시지만 참고용 |
| **ProfileService + ReplicaService** | https://devforum.roblox.com/t/data-storingpresenting/1464984 | 데이터 저장 + 클라이언트 동기화 |

**핵심 기능**: 세션 잠금(아이템 복제 방지), GlobalUpdates(서버 간 통신), 버전 관리

### 성능 최적화 및 프로파일링
| 자료 | URL | 학습 내용 |
|------|-----|----------|
| **공식 최적화 가이드** | https://create.roblox.com/docs/performance-optimization | 프레임 레이트, 메모리, 로드 시간 |
| **MicroProfiler 문서** | https://create.roblox.com/docs/performance-optimization/microprofiler | CPU/메모리 프레임별 분석 |

**핵심 지표**: 목표 60 FPS (**16.67ms/프레임**), 서버 메모리 **50% 이하** 유지, Shift+F5로 인게임 성능 확인

### 고급 UI: React-lua (Roact 대체)
**Roact는 2025년 기준 deprecated**입니다. 새 프로젝트는 **react-lua**를 사용하세요.

| 자료 | URL | 설명 |
|------|-----|------|
| **React-lua 공식 튜토리얼** | https://devforum.roblox.com/t/how-to-react-roblox/2964543 | Roblox 직원 작성, Hooks 지원 |
| **API 레퍼런스** | https://jsdotlua.github.io/react-lua/api-reference/react-roblox/ | 커뮤니티 포크 문서 |
| **react-luau GitHub** | https://github.com/Roblox/react-luau | 공식 ReactJS 17.x Luau 번역 |

**대안**: **Fusion** (https://elttob.uk/Fusion/) - React보다 학습 곡선이 낮음 (나무위키에서 추천)

---

## 커뮤니티 자료 및 학습 경로

### Discord 커뮤니티
| 커뮤니티 | 초대 링크 | 특징 |
|----------|----------|------|
| **HiddenDevs** | https://discord.com/invite/hd | 25만+ 멤버, 스킬 개발, 네트워킹, 협업 |
| **Roblox Developers** | https://discord.com/invite/robloxdevs | 7만+ 멤버, 일반 개발 토론 |
| **Roblox OSS** | https://discord.gg/wH5ncNS | Matter, Rojo 등 오픈소스 프로젝트 |
| **roblox-ts** | https://discord.roblox-ts.com | TypeScript, Flamework 지원 |

### GitHub 학습용 프로젝트
| 프로젝트 | URL | 학습 포인트 |
|----------|-----|-------------|
| **awesome-roblox** | https://github.com/buoyantair/awesome-roblox | 프레임워크, 라이브러리 큐레이션 |
| **useful-roblox-resources** | https://github.com/loominatrx/useful-roblox-resources | UI, 도구, 유틸리티 종합 |
| **ProfileService** | https://github.com/MadStudioRoblox/ProfileService | 잘 문서화된 모듈 예시 |
| **BridgeNet2** | https://github.com/ffrostfall/BridgeNet2 | 깔끔한 네트워킹 아키텍처 |

### DevForum 고급 튜토리얼
| 튜토리얼 | URL | 내용 |
|----------|-----|------|
| **Advanced Scripting Tutorial** | https://devforum.roblox.com/t/advanced-scripting-tutorial/3511460 | 모듈, 메타테이블, OOP |
| **Advanced Scripting Part 2** | https://devforum.roblox.com/t/advanced-scripting-tutorial-part-2/3541190 | 최적화, 바이너리 최적화 |
| **Clean Code Series** | DevForum 검색 | 코드 품질 향상 |

### 장르별 프로젝트 튜토리얼
| 장르 | URL | 난이도 |
|------|-----|--------|
| **FPS 게임** | https://gamedevacademy.org/roblox-fps-tutorial/ | 중급 |
| **타이쿤** | https://gamedevacademy.org/roblox-tycoon-tutorial-tutorial-complete-guide/ | 중급 |
| **FPS 시리즈** | https://devforum.roblox.com/t/fps-tutorial-part-1/1013047 | 중급 |

---

## 한국어 학습 자료

| 자료 | URL | 내용 |
|------|-----|------|
| **공식 스크립팅 문서** | https://create.roblox.com/docs/ko-kr/scripting | 로블록스 공식 한국어 번역 |
| **스크립팅 소개** | https://create.roblox.com/docs/ko-kr/tutorials/use-case-tutorials/scripting/basic-scripting/intro-to-scripting | 공식 튜토리얼 |
| **나무위키 Roblox Studio** | https://namu.wiki/w/Roblox%20Studio | 스크립팅, 플러그인, 팁 |
| **나무위키 스크립트** | https://namu.wiki/w/Roblox%20Studio/%EC%8A%A4%ED%81%AC%EB%A6%BD%ED%8A%B8 | React-lua, Fusion, 정리 라이브러리(Maid, Trove) 설명 |

---

## 권장 학습 로드맵

**1단계 (1-2주)**: 공식 Gameplay Scripting 커리큘럼 완료 → 클라이언트-서버 패턴 마스터

**2단계 (2-3주)**: Wally 패키지 매니저 설정 → Knit 프레임워크로 첫 프로젝트 구조화

**3단계 (3-4주)**: ProfileStore로 데이터 시스템 구축 → BridgeNet2로 네트워킹 최적화

**4단계 (선택)**: 
- TypeScript 선호 시: roblox-ts + Flamework 전환
- 대규모 엔티티 게임: Matter ECS 학습
- UI 중심 프로젝트: React-lua 또는 Fusion

**5단계 (지속)**: HiddenDevs Discord 참여, GitHub 오픈소스 기여, 자신만의 게임 출시 및 운영

모든 자료는 무료이며, 공식 문서와 커뮤니티 검증된 자료를 우선으로 선정했습니다. 학습 순서는 의존성을 고려하여 배치했으므로, 순서대로 진행하시면 자연스럽게 실력이 향상됩니다.