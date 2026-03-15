# Hướng Dẫn Conventional Commits

## Mục Lục

1. [Giới Thiệu](#giới-thiệu)
2. [Format Cơ Bản](#format-cơ-bản)
3. [Các Loại Commit (Types)](#các-loại-commit-types)
4. [Scope - Phạm Vi](#scope---phạm-vi)
5. [Breaking Changes](#breaking-changes)
6. [Description - Mô Tả](#description---mô-tả)
7. [Body - Nội Dung](#body---nội-dung)
8. [Footer - Chân Trang](#footer)
9. [Ví Dụ Thực Tế](#ví-dụ-thực-tế)
10. [Quy Tắc Version](#quy-tắc-version)
11. [Lợi Ích](#lợi-ích)
12. [Checklist Nhanh](#checklist-nhanh)

---

## Giới Thiệu

**Conventional Commits** là một quy ước về cách viết commit message nhằm mục đích:

- Tự động tạo CHANGELOG
- Tự động quyết định version bump (semantic versioning)
- Dễ dàng hiểu lịch sử project
- Giúp team phối hợp hiệu quả hơn

Một thay đổi nhỏ trong cách viết commit message có thể tạo ra sự khác biệt lớn!

---

## Format Cơ Bản

### Cấu Trúc Chung

```
<type>(<scope (tùy chọn)>): <description>

<body (tùy chọn)>

<footer (tùy chọn)>
```

### Command Line

```bash
git commit -m "feat(auth): add login with Google" \
  -m "Users can now sign in using their Google account" \
  -m "Closes #123"
```

### Các Phần Quan Trọng

1. **Type** (bắt buộc) - Loại thay đổi
2. **Scope** (tùy chọn) - Phạm vi ảnh hưởng
3. **Description** (bắt buộc) - Mô tả ngắn gọn
4. **Body** (tùy chọn) - Giải thích chi tiết
5. **Footer** (tùy chọn) - Breaking changes, issue references

---

## Các Loại Commit (Types)

### 1. Changes Liên Quan Đến API hoặc UI

#### `feat` - Feature Mới

**Sử dụng khi:** Thêm, điều chỉnh, hoặc xóa một feature mới cho API hoặc UI

**Ví dụ:**

```bash
feat: add user profile page
feat(api): add endpoint for user preferences
feat(cart): implement checkout flow
```

**Ảnh hưởng version:** Tăng MINOR version (1.0.0 → 1.1.0)

#### `fix` - Sửa Bug

**Sử dụng khi:** Sửa bug của API hoặc UI từ một `feat` commit trước đó

**Ví dụ:**

```bash
fix: resolve login button not clickable
fix(auth): fix token expiration issue
fix(ui): correct alignment of header menu
```

**Ảnh hưởng version:** Tăng PATCH version (1.0.0 → 1.0.1)

---

### 2. Code Restructuring

#### `refactor` - Tái Cấu Trúc

**Sử dụng khi:** Viết lại hoặc tái cấu trúc code mà KHÔNG thay đổi hành vi của API/UI

**Ví dụ:**

```bash
refactor: simplify authentication logic
refactor(database): optimize query structure
refactor: extract utility functions to separate file
```

**Ảnh hưởng version:** Tăng PATCH version

#### `perf` - Cải Thiện Performance

**Sử dụng khi:** Refactor để cải thiện hiệu suất

**Ví dụ:**

```bash
perf: reduce memory footprint by 40%
perf(api): optimize database queries
perf: implement lazy loading for images
```

**Ảnh hưởng version:** Tăng PATCH version

---

### 3. Styling

#### `style` - Code Style

**Sử dụng khi:** Thay đổi về code style (whitespace, formatting, thiếu dấu chấm phẩy) mà KHÔNG ảnh hưởng hành vi của app

**Ví dụ:**

```bash
style: format code with prettier
style: fix indentation in auth service
style: remove trailing whitespace
```

**Ảnh hưởng version:** Không tăng version

---

### 4. Testing

#### `test` - Tests

**Sử dụng khi:** Thêm tests thiếu hoặc sửa tests hiện có

**Ví dụ:**

```bash
test: add unit tests for login service
test(api): add integration tests for user endpoints
test: fix flaky test in checkout flow
```

**Ảnh hưởng version:** Không tăng version

---

### 5. Documentation

#### `docs` - Documentation

**Sử dụng khi:** Thay đổi chỉ ảnh hưởng đến documentation

**Ví dụ:**

```bash
docs: update API documentation
docs: add setup instructions to README
docs(api): document authentication flow
```

**Ảnh hưởng version:** Không tăng version

---

### 6. Build-Related

#### `build` - Build System

**Sử dụng khi:** Thay đổi ảnh hưởng đến build tools, dependencies, project version, CI/CD pipelines

**Ví dụ:**

```bash
build: update webpack to version 5
build: add eslint configuration
build(deps): upgrade react to 18.2.0
build(ci): add automated deployment pipeline
```

**Ảnh hưởng version:** Không tăng version (trừ khi là breaking change)

---

### 7. Operations

#### `ops` - Operational

**Sử dụng khi:** Thay đổi về infrastructure, deployment, backup, recovery procedures

**Ví dụ:**

```bash
ops: configure load balancer
ops: update database backup schedule
ops: migrate to AWS infrastructure
```

**Ảnh hưởng version:** Không tăng version

---

### 8. Miscellaneous

#### `chore` - Chores

**Sử dụng khi:** Tasks như initial commit, sửa .gitignore, các task maintenance khác

**Ví dụ:**

```bash
chore: init project
chore: update .gitignore
chore: cleanup unused dependencies
```

**Ảnh hưởng version:** Không tăng version

**Lưu ý:** Không lạm dụng `chore` - nếu có type phù hợp hơn, hãy dùng type đó!

---

## Scope - Phạm Vi

**Scope** cung cấp thông tin ngữ cảnh bổ sung về nơi thay đổi xảy ra.

### Quy Tắc:

- Scope là **tùy chọn** (optional)
- Scope được định nghĩa bởi từng project cụ thể
- **KHÔNG** sử dụng issue identifiers (jira id hoặc issue id trên GitHub) làm scope

### Ví Dụ:

```bash
feat(auth): add OAuth2 support
fix(shopping-cart): prevent duplicate items
refactor(api/users): simplify user model
docs(readme): add installation guide
```

### Scope Phổ Biến:

**Frontend:**

- `ui` - User interface
- `auth` - Authentication
- `cart` - Shopping cart
- `checkout` - Checkout flow
- `dashboard` - Dashboard

**Backend:**

- `api` - API layer
- `database` - Database
- `auth` - Authentication
- `users` - User management
- `payments` - Payment processing

**General:**

- `config` - Configuration
- `deps` - Dependencies
- `ci` - CI/CD
- `docker` - Docker related

---

## Breaking Changes

### Breaking Changes Indicator

**Breaking change** là thay đổi làm hỏng backward compatibility (người dùng phải thay đổi code của họ).

### Hai Cách Đánh Dấu:

#### 1. Sử dụng `!` sau type/scope

```bash
feat!: remove deprecated API endpoints
feat(api)!: change response format to JSON-API spec
refactor!: rename User model to Account
```

#### 2. Sử dụng `BREAKING CHANGE:` trong footer

```bash
feat: update authentication flow

BREAKING CHANGE: The /login endpoint now requires email instead of username
```

### Khi Nào Là Breaking Change?

- Xóa hoặc đổi tên API endpoints
- Thay đổi request/response format
- Xóa hoặc đổi tên function/class public
- Thay đổi database schema không backward compatible
- Thay đổi config file format
- Xóa feature mà users đang dùng

### Ảnh Hưởng Version:

Breaking changes **LUÔN** tăng MAJOR version (1.0.0 → 2.0.0)

---

## Description - Mô Tả

Description là phần mô tả ngắn gọn về thay đổi.

### Quy Tắc BẮT BUỘC:

1. **Description là MANDATORY** - bắt buộc phải có
2. **Dùng imperative, present tense** - "change" không phải "changed" hay "changes"
   - Nghĩ theo kiểu: "This commit will..." hoặc "This commit should..."
3. **KHÔNG viết hoa chữ cái đầu**
4. **KHÔNG kết thúc bằng dấu chấm (.)**
5. Nếu là breaking change, xem thêm [breaking changes indicator](#breaking-changes)

### ✅ Tốt:

```bash
feat: add email notifications
fix: resolve memory leak in user service
refactor: simplify authentication logic
```

### ❌ Không Tốt:

```bash
feat: Add email notifications          # Viết hoa chữ đầu
fix: Resolved memory leak.             # Past tense + dấu chấm
refactor: Simplifying auth logic       # -ing form
```

---

## Body - Nội Dung

Body giải thích **động lực** cho thay đổi và đối chiếu với hành vi trước đó.

### Quy Tắc:

- Body là **TÙY CHỌN**
- Dùng imperative, present tense
- Tách khỏi description bằng một dòng trống

### Khi Nào Dùng Body:

- Thay đổi phức tạp cần giải thích
- Cần giải thích "tại sao" thay vì "cái gì"
- Có nhiều cách implement, cần giải thích tại sao chọn cách này

### Ví Dụ:

```bash
feat: implement caching for API responses

Add Redis caching layer to reduce database load.
Cache expires after 5 minutes to ensure fresh data.
This improves response time by approximately 60%.
```

```bash
fix: resolve race condition in payment processing

The error occurred when multiple requests hit the payment
endpoint simultaneously. Add transaction locking to ensure
only one payment is processed at a time.
```

---

## Footer

Footer chứa thông tin về **Breaking Changes** và **issue references**.

### Quy Tắc:

- Footer là **TÙY CHỌN**, trừ khi có breaking changes
- Reference issues tùy ý (ví dụ: `Closes #123`, `Fixes JIRA-456`)
- **Breaking Changes** PHẢI bắt đầu với `BREAKING CHANGE:`

### Breaking Change trong Footer:

**Single line:**

```bash
BREAKING CHANGE: removed support for Node 12
```

**Multi-line:**

```bash
BREAKING CHANGE:

The authentication API has been completely redesigned.
All clients must update to use OAuth2 flow.
Username/password authentication is no longer supported.
```

### Issue References:

```bash
Closes #123
Fixes #456, #789
Resolves JIRA-1337
Related to #999
```

### Ví Dụ Đầy Đủ:

```bash
feat(api)!: redesign authentication endpoints

Update authentication to use OAuth2 standard.
Remove legacy username/password authentication.

BREAKING CHANGE: The /auth endpoints have been completely
redesigned. Clients must migrate to OAuth2 flow. See
migration guide in docs/auth-migration.md

Closes #234
Fixes #567
```

---

## Ví Dụ Thực Tế

### 1. Feature Đơn Giản

```bash
feat: add email notifications on new direct messages
```

### 2. Feature Với Scope

```bash
feat(shopping-cart): add the amazing buy now button
```

### 3. Breaking Change

```bash
feat!: remove ticket list endpoint

refers to JIRA-1337

BREAKING CHANGE: ticket endpoints no longer support list all entities.
Use the new paginated endpoint /api/tickets/search instead.
```

### 4. Bug Fix Đơn Giản

```bash
fix(shopping-cart): prevent ordering an empty cart
```

### 5. Bug Fix Với Giải Thích

```bash
fix: add missing parameter to service call

The error occurred because the userId parameter was not
being passed to the validateUser function, causing
authentication to fail silently.
```

### 6. Performance Improvement

```bash
perf: decrease memory footprint for unique visitors by using HyperLogLog
```

### 7. Build Related

```bash
build: update dependencies
```

```bash
build(release): bump version to 1.0.0
```

### 8. Refactor

```bash
refactor: implement fibonacci calculation as recursion
```

### 9. Style

```bash
style: remove empty lines and fix indentation
```

### 10. Documentation

```bash
docs: add API authentication examples
```

### 11. Tests

```bash
test: add unit tests for payment service
```

### 12. Initial Commit

```bash
chore: init
```

### 13. Merge Commit

```bash
Merge branch 'feature/user-auth'
```

### 14. Revert Commit

```bash
Revert "feat: add experimental feature"

This reverts commit abc123def456.
```

---

## Quy Tắc Version

Conventional Commits tuân theo **Semantic Versioning** (MAJOR.MINOR.PATCH)

### Cách Quyết Định Version Bump:

**Nếu release tiếp theo chứa commits với:**

1. **Breaking Changes** → Tăng **MAJOR** version
   - `1.0.0` → `2.0.0`
   - Ví dụ: `feat!:`, `fix!:`, `BREAKING CHANGE:`

2. **API/UI Changes** (`feat` hoặc `fix`) → Tăng **MINOR** version
   - `1.0.0` → `1.1.0`
   - Ví dụ: `feat:`, `fix:`

3. **Còn lại** → Tăng **PATCH** version
   - `1.0.0` → `1.0.1`
   - Ví dụ: `refactor:`, `perf:`, `style:`, `build:`

### Decision Flow:

```
Có Breaking Change?
├─ Có → MAJOR (2.0.0)
└─ Không
   ├─ Có feat hoặc fix?
   │  └─ Có → MINOR (1.1.0)
   └─ Không → PATCH (1.0.1)
```

### Ví Dụ:

```bash
# Version hiện tại: 1.2.3

# Commits trong release mới:
- refactor: optimize database queries
- style: format code
- feat: add dark mode
- fix: resolve crash on startup

# Version mới: 1.3.0 (vì có feat/fix)
```

```bash
# Version hiện tại: 1.2.3

# Commits trong release mới:
- refactor: simplify auth logic
- perf: improve loading time
- test: add integration tests

# Version mới: 1.2.4 (chỉ có refactor/perf/test)
```

```bash
# Version hiện tại: 1.2.3

# Commits trong release mới:
- feat!: remove legacy API endpoints
- fix: resolve memory leak

# Version mới: 2.0.0 (vì có breaking change)
```

---

## Lợi Ích

### 1. Tự Động Hóa

- **Tự động generate CHANGELOG** từ commit history
- **Tự động bump version** dựa trên commit types
- **Tự động deploy** khi có version mới

### 2. Communication Tốt Hơn

- Dễ hiểu những gì đã thay đổi
- Dễ tìm commits cụ thể
- Dễ onboard members mới

### 3. Structured History

- Lịch sử có cấu trúc rõ ràng
- Dễ dàng review code
- Dễ dàng revert changes

### 4. Collaboration

- Team consistency
- Code review hiệu quả hơn
- Release notes tự động

---

## Checklist Nhanh

### Trước Khi Commit:

**Chọn Type:**

```
Bug fix?                                  → fix
Feature mới/thay đổi?                     → feat
Performance improvement?                  → perf
Code restructuring (no behavior change)?  → refactor
Formatting only?                          → style
Tests?                                    → test
Documentation?                            → docs
Build/dependencies?                       → build
DevOps/infrastructure?                    → ops
Maintenance tasks?                        → chore
```

**Viết Description:**

- [ ] Imperative mood ("add" not "added")
- [ ] Không viết hoa chữ đầu
- [ ] Không kết thúc bằng dấu chấm
- [ ] Ngắn gọn (<50 characters nếu có thể)

**Breaking Change?**

- [ ] Có breaking change? → Thêm `!` hoặc `BREAKING CHANGE:` trong footer
- [ ] Giải thích breaking change chi tiết

**Body (nếu cần):**

- [ ] Tách khỏi description bằng dòng trống
- [ ] Giải thích "tại sao" hơn là "cái gì"
- [ ] Imperative mood

**Footer (nếu cần):**

- [ ] Reference issues: `Closes #123`
- [ ] Breaking changes: `BREAKING CHANGE:`

---

## Ví Dụ Template Để Copy

### Basic Feature

```bash
feat(<scope>): <description>
```

### Feature với Body

```bash
feat(<scope>): <description>

<body>

Closes #<issue>
```

### Breaking Change

```bash
feat(<scope>)!: <description>

<body>

BREAKING CHANGE: <explanation>

Closes #<issue>
```

### Bug Fix

```bash
fix(<scope>): <description>

<body if needed>

Fixes #<issue>
```

---

## Tools Team đang sử dụng

### git-conventional-commits

Tool để làm việc với Conventional Commits - validate messages, generate changelog, và determine version.

**Repository:** <https://github.com/qoomon/git-conventional-commits>

**Tính năng:**

- ✅ Validate commit messages tự động với git hooks
- ✅ Generate CHANGELOG từ commit history
- ✅ Determine semantic version từ commits
- ✅ Highly configurable qua file config

**Setup đã được config trong repo:**

Team đã setup `git-conventional-commits` với `pre-commit` framework. Khi bạn clone repo và setup lần đầu:

```bash
# 1. Cài đặt pre-commit framework (nếu chưa có)
pip install pre-commit
# hoặc sử dụng brew nếu MacOS
brew install pre-commit

# 2. Install git hooks
pre-commit install -t commit-msg

# 3. Kiểm Tra Hook Đã Active
pre-commit --version
pre-commit run --all-files  # Test với mọi file

# Done! Giờ mọi commit sẽ tự động được validate
```

**Config file:** File `git-conventional-commits.yaml` trong repo đã được config với:

- Các commit types được phép (feat, fix, refactor, perf, style, test, docs, build, ops, chore)
- Format cho CHANGELOG
- URLs cho commit links và issue tracking

### pre-commit Framework

Framework để manage Git hooks một cách dễ dàng.

**Website:** <https://pre-commit.com/>

**Lợi ích:**

- Manage hooks thông qua file `.pre-commit-config.yaml`
- Dễ dàng share hooks với team
- Tự động cài đặt dependencies của hooks
- Support nhiều loại hooks (commit-msg, pre-commit, pre-push, etc.)

**File config:** `.pre-commit-config.yaml` đã có trong repo

### Workflow Thực Tế

Với setup hiện tại, workflow của bạn sẽ là:

```bash
# 1. Làm việc bình thường
git add .

# 2. Commit với conventional format
git commit -m "feat(auth): add Google login"

# 3. Hook tự động chạy và validate
# ✅ Nếu format đúng: commit thành công
# ❌ Nếu format sai: commit bị reject với error message

# 4. Push lên remote
git push origin feature-branch
```

**Nếu commit bị reject:**

```bash
# Hook sẽ show error:
# ❌ Invalid commit message format!
#
# Format: ():
#
# Example: feat(auth): add Google login
#
# Types: feat, fix, refactor, perf, style, test, docs, build, ops, chore

# Fix commit message và thử lại
git commit -m "feat(auth): add Google login"  # ✅ Correct format
```

---

## Tham Khảo

- [Conventional Commits Official](https://www.conventionalcommits.org/)
- [Semantic Versioning](https://semver.org/)
- [Angular Contributing Guidelines](https://github.com/angular/angular/blob/master/CONTRIBUTING.md)

---

## Tóm Tắt

**Format:**

```
<type>(<scope>): <description>

<body>

<footer>
```

**Types quan trọng nhất:**

- `feat` - Feature mới (MINOR bump)
- `fix` - Bug fix (PATCH bump)
- `refactor` - Code refactoring
- `!` hoặc `BREAKING CHANGE` - Breaking changes (MAJOR bump)

**Quy tắc vàng:**

1. Luôn dùng imperative mood
2. Description không viết hoa, không dấu chấm
3. Breaking changes PHẢI được đánh dấu
4. Commit thường xuyên với messages rõ ràng

**Nhớ:** Một commit message tốt là một commit message mà sau 6 tháng bạn vẫn hiểu được mình đã làm gì và tại sao! 🚀
