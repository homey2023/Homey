# Contributing to Homey

First off, thank you for considering contributing to homey. 

## How Can I Contribute?

### Reporting Bugs

- GitHub의 [Issues](https://github.com/homey2023/Homey/issues)에서 이미 제보된 버그인지 확인하세요.
- 동일한 문제를 다루는 열린 이슈를 찾을 수 없다면, [New Issue](https://github.com/homey2023/Homey/issues/new/choose). **제목과 명확한 설명**을 포함하고 가능한 한 많은 관련 정보와 **code sample** 또는 **executable test case**를 제공하여 예상되는 동작이 발생하지 않는 것을 보여주십시오.

### Suggesting Enhancements

- 제안에 대한 새로운 [New Issue](https://github.com/homey2023/Homey/issues/new/choose)를 엽니다. **명확한 제목과 설명**을 포함하고 가능한 한 많은 관련 정보를 제공하며 새 기능이나 개선 사항을 구현하기 위한 **Step-by-Step**을 포함하세요.

### Pull Requests

- Repository를 Fork하고 `main`에서 새로운 브랜치를 생성합니다.
- 코드가 스타일 가이드를 따르고 repository에 지정된 linting 또는 testing 요구 사항을 통과하는지 확인하세요.
- 지정된 커밋 및 브랜치 명명 규칙에 따라 형식이 잘 지켜진 commit 메시지를 작성하세요.
- Upstream repository `main` branch에 대한 pull request를 제출하세요.
- 피드백이나 요청 사항을 적용하기 위해 준비하세요.

## Style Guides

### Commit Messages Convention

#### 1. Commit 유형 지정
- FEAT : 새로운 기능의 추가
- FIX: 버그 수정
- DOCS: 문서 수정
- STYLE: 스타일 관련 기능(코드 포맷팅, 세미콜론 누락, 코드 자체의 변경이 없는 경우)
- REFACTOR: 코드 리펙토링
- TEST: 테스트 코트, 리펙토링 테스트 코드 추가
- CHORE: 빌드 업무 수정, 패키지 매니저 수정(ex .gitignore 수정)

#### 2. 제목과 본문을 빈 행으로 분리

```
TAG: Summarize changes in around 50 characters or less

More detailed explanatory text, if necessary.
```

#### 3. 제목 행을 영문 50자로 제한

#### 4. 제목 행의 첫 글자는 대문자로 시작
`readme file modification` X

`Readme file modification` O

#### 5. 제목 행 끝에 마침표를 넣지 않는다
`Open the door.` X

`Open the door` O

#### 6. 제목 행에 명령문을 사용한다
```
Clean your room
Close the door
Take out the trash
```
#### 7. 본문은 72자마다 끊어 줄을 바꿔준다.

#### Example

```
TAG: Summarize changes in around 50 characters or less

More detailed explanatory text, if necessary. Wrap it to about 72
characters or so. In some contexts, the first line is treated as the
subject of the commit and the rest of the text as the body. The
blank line separating the summary from the body is critical (unless
you omit the body entirely); various tools like `log`, `shortlog`
and `rebase` can get confused if you run the two together.

Explain the problem that this commit is solving. Focus on why you
are making this change as opposed to how (the code explains that).
Are there side effects or other unintuitive consequences of this
change? Here's the place to explain them.

Further paragraphs come after blank lines.

 - Bullet points are okay, too

 - Typically a hyphen or asterisk is used for the bullet, preceded
   by a single space, with blank lines in between, but conventions
   vary here

If you use an issue tracker, put references to them at the bottom,
like this:

Resolves: #123
See also: #456, #789
```

### Branches Convention

브랜치 명은 다음 형식을 사용합니다:
`<type>/<short-description>` or `<type>/issue-<issue-number>/<short-description>`

여기서 `<type>`은 아래에 나열된 미리 정의된 branch type 중 하나이고, `<short-description>`은 브랜치 목적의 간결하고 설명적인 요약입니다. 글자는 모두 소문자로 작성하며, 단어 사이에는 `-`를 사용하는 **kebab-case**를 사용합니다.

#### Branch Type

1. **feature**: 새로운 기능이나 개선 사항을 개발할 때 사용합니다.
   - Example: `feature/add-login`
2. **bugfix**: 버그 수정이나 issue 해결을 할 때 사용합니다.
   - Example: `bugfix/fix-login-error`
3. **hotfix**: 긴급한 수정이 필요할 때 사용합니다.
   - Example: `hotfix/patch-security-vulnerability`
4. **refactor**: 기존 코드를 리팩토링하거나 구조를 개선할 때 사용합니다 (동작은 변경하지 않음).
   - Example: `refactor/cleanup-login-code`
5. **docs**: 문서 업데이트나 추가를 할 때 사용합니다. (README 파일이나 코드 주석 등.)
   - Example: `docs/update-readme`
6. **test**: 테스트를 추가하거나 수정할 때 사용합니다.
   - Example: `test/improve-login-tests`
7. **chore**: 다른 카테고리에 속하지 않는 작은 작업이나 유지 보수 작업을 할 때 사용합니다.
   - Example: `chore/update-dependencies`

#### Notes
- 항상 새로운 브랜치를 `main` 또는 `develop` 브랜치로부터 생성하세요 
- 브랜치 이름을 짧고 설명적으로 유지하세요.
- 브랜치가 merge되고 더 이상 필요하지 않은 경우 삭제하세요.

### Code Style
 
- Python: [PEP8](https://www.python.org/dev/peps/pep-0008/) style guide
- Dart (Flutter): [Effective Dart](https://dart.dev/guides/language/effective-dart)  style guide

## Thank You

We appreciate your contribution to the project, and we look forward to working together to make Homey even better!
