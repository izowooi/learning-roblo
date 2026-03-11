# Poop Dodge 개발 가이드

혼자서 제로베이스에서 시작해 Roblox 게임을 출시하기 위한 실전 체크리스트입니다.

---

## 전체 개발 흐름

1. 프로젝트 생성 / 퍼블리시 / 기본 구조 만들기
2. 로비 + 경기장 맵 만들기
3. 라운드 시스템 만들기
4. 똥 낙하 시스템 만들기
5. 피격 / 탈락 시스템 만들기
6. UI 만들기
7. 사운드 / 연출 최소 추가
8. 테스트
9. 공개 준비
10. 출시

---

## 1단계 — 프로젝트 뼈대 만들기

### 목표
- 새 프로젝트 생성
- 첫 Publish 완료
- Max Players = 8
- Explorer / Properties 표시
- 기본 폴더 구조 정리
- 로컬 백업 파일 1개 생성

### 이번 단계 완료 기준
- 프로젝트가 Roblox에 저장되어 있음
- Max Players가 8로 설정되어 있음
- 기본 폴더 구조가 정리되어 있음
- 로컬 백업 파일(.rbxl)이 있음

### 권장 기본 설정
- Name: `Poop Dodge`
- Description: `Dodge falling poop. Get hit 3 times and you're out. Last player wins.`
- Devices: Computer / Phone / Tablet
- VR: 끔
- Team Create: 켬
- Data Sharing: 끔
- Max Players: 8
- Server Fill: Roblox Optimized

### 기본 폴더 구조
```text
Workspace
 ├─ Lobby
 ├─ Arena
 ├─ SpawnPoints
 └─ SpectatorZone

ReplicatedStorage
 ├─ Assets
 ├─ Shared
 └─ Remotes

ServerScriptService
 ├─ RoundService
 ├─ PlayerStateService
 └─ PoopSpawner

ServerStorage
 └─ ReservedAssets

StarterGui
 ├─ LobbyUI
 ├─ RoundUI
 └─ ResultUI
```

### 1단계 체크리스트
- [ ] 새 프로젝트 생성
- [ ] File → Publish to Roblox 완료
- [ ] Name / Description 입력
- [ ] Explorer 표시
- [ ] Properties 표시
- [ ] Max Players = 8
- [ ] Server Fill = Roblox Optimized
- [ ] 기본 폴더 구조 생성
- [ ] 로컬 백업 파일 저장

### 저장 / 백업 규칙
- **Save to Roblox**: 현재 작업 내용을 Roblox 클라우드의 이 place에 저장
- **Download a Copy**: 내 컴퓨터에 `.rbxl` 백업 파일 저장

### 추천 습관
- 작업 중 자주: **Save to Roblox**
- 단계 마무리 시점: **Download a Copy**

### 권장 백업 파일명 예시
- `poop_dodge_step1_2026-03-12.rbxl`
- `poop_dodge_step2_mapblockout_2026-03-12.rbxl`
- `poop_dodge_step3_roundloop_2026-03-12.rbxl`

---

## 2단계 — 로비와 경기장 만들기

### 목표
- 로비 구역 만들기
- 경기장 구역 만들기
- 관전자 구역 만들기
- 스폰 위치 나누기
- 아주 단순한 플레이 공간 확보

### 맵 구성 원칙
- 외부 모델 최소
- Roblox 기본 Part 위주
- 예쁜 것보다 구분이 먼저
- 작은 완성품 1개가 중요

### 맵 추천 구조
- 로비: 대기 공간 + 룰 안내판
- 경기장: 정사각형 또는 원형 단순 방
- 관전자 구역: 경기장 밖 높은 위치
- 장애물: 2~4개만

### 권장 크기 예시
- 로비 바닥: 60 x 1 x 60
- 경기장 바닥: 70 x 1 x 70
- 경기장 벽 높이: 20~30
- 장애물 수: 2~4개

### 2단계에서 만들 오브젝트
#### Workspace/Lobby
- 로비 바닥
- 로비 스폰 위치
- 룰 보드 자리

#### Workspace/Arena
- 경기장 바닥
- 경기장 벽 4개
- 장애물 2~4개

#### Workspace/SpectatorZone
- 관전자용 바닥
- 관전자용 스폰 위치

#### Workspace/SpawnPoints
- LobbySpawn
- ArenaSpawn1 ~ ArenaSpawn8
- SpectatorSpawn

### 2단계 체크리스트
- [ ] 로비 바닥 생성
- [ ] 경기장 바닥 생성
- [ ] 경기장 벽 생성
- [ ] 관전자 구역 생성
- [ ] LobbySpawn 배치
- [ ] ArenaSpawn 8개 배치
- [ ] SpectatorSpawn 배치
- [ ] 장애물 2~4개 배치
- [ ] 각 오브젝트 이름 정리

### 2단계 완료 기준
- 플레이어가 로비 위치를 구분할 수 있다
- 경기장이 눈에 보이고 범위가 명확하다
- 관전자 공간이 따로 있다
- ArenaSpawn이 8개 준비되어 있다

---

## 저장 습관 추천

### 작업 중
- 큰 수정 전: Save to Roblox
- 큰 수정 후: Save to Roblox

### 단계 종료 시
- Download a Copy로 로컬 백업 저장

### 추천 규칙
- 10~15분마다 Save to Roblox
- 단계 완료 때마다 Download a Copy
- 아주 많이 바꾸기 전에도 Download a Copy

---

## 다음 단계 예고

### 3단계
- 라운드 상태 만들기
- 카운트다운 만들기
- 로비 → 경기장 이동 만들기
- 경기장 → 로비 복귀 만들기

