# Verilog 作业提交说明（学生版）

课程仓库：<https://github.com/rosickey/verilog-homework-2026>

本课程使用 GitHub Pull Request（PR）提交作业。每位同学固定使用自己的：

- GitHub 账号；
- 9 位学号分支；
- `students/学号/` 目录。

例如，11 专业 1 号学生的学号为 `240201101`，则对应关系必须是：

```text
分支：240201101
目录：students/240201101/
```

> 重要：学生只能修改自己的学号目录。不要修改 `README.md`、`.github/`、`assignments/` 或其他同学的目录。

## 一、第一次提交：注册学号与 GitHub 用户名

第一次 PR **只注册身份，不提交作业代码**。教师审核并合并后，学号与 GitHub 用户名即完成绑定。

### 1. Fork 课程仓库

登录自己的 GitHub 账号，打开课程仓库，点击右上角的 **Fork**，将仓库复制到自己的账号下。

例如 GitHub 用户名为 `wangming123`，Fork 后的仓库是：

```text
https://github.com/wangming123/verilog-homework-2026
```

### 2. Clone 自己的 Fork

把下面命令中的 `你的GitHub用户名` 替换为自己的用户名：

```bash
git clone https://github.com/你的GitHub用户名/verilog-homework-2026.git
cd verilog-homework-2026
```

第一次使用 Git 时，可先设置提交者姓名和邮箱：

```bash
git config --global user.name "你的姓名"
git config --global user.email "你的GitHub邮箱"
```

### 3. 添加教师仓库为 upstream

```bash
git remote add upstream https://github.com/rosickey/verilog-homework-2026.git
git remote -v
```

其中：

- `origin` 是你自己的 Fork；
- `upstream` 是教师的课程仓库。

### 4. 创建学号分支

先取得教师仓库的最新内容，再创建以完整学号命名的分支：

```bash
git fetch upstream
git switch main
git pull --ff-only upstream main
git switch -c 240201101
```

请把示例学号 `240201101` 替换为你自己的 9 位学号。

检查当前分支：

```bash
git branch --show-current
```

输出必须是你自己的完整学号。不要使用 `HW01`、`姓名-HW01` 或 `学号-HW01` 作为分支名。

### 5. 创建身份文件

创建自己的目录：

```bash
mkdir -p students/240201101
```

在该目录中新建文件：

```text
students/240201101/.student.yml
```

文件内容如下：

```yaml
student_id: "240201101"
name: "王明"
github_username: "wangming123"
```

请替换为自己的真实信息：

- `student_id`：9 位完整学号，必须与分支名、目录名一致；
- `name`：真实姓名；
- `github_username`：GitHub 用户名，不是昵称，也不是邮箱。

例如 GitHub 主页地址是 `https://github.com/wangming123`，用户名就是 `wangming123`。

### 6. 检查、提交并 Push

第一次 PR 只能包含自己的 `.student.yml`：

```bash
git status
git add students/240201101/.student.yml
git commit -m "register 240201101 王明"
git push -u origin 240201101
```

请将命令中的学号和姓名替换为自己的信息。

### 7. 创建第一次 Pull Request

打开自己 Fork 后的仓库，点击 **Compare & pull request**，确认：

```text
base repository: rosickey/verilog-homework-2026
base branch:     main
head repository: 你的GitHub用户名/verilog-homework-2026
compare branch:   你的学号
```

PR 标题统一写为：

```text
[REGISTER] 240201101 王明
```

教师将核对：

1. PR 提交者是否为本人 GitHub 账号；
2. 分支、目录和 `student_id` 是否为同一个学号；
3. `github_username` 是否与 PR 提交者一致；
4. PR 是否只新增自己的 `.student.yml`。

审核通过并合并后，绑定关系固定为：

```text
GitHub 用户名 ↔ 学号 ↔ 学号分支 ↔ 学号目录
```

注册完成后，学生不得自行修改或删除 `.student.yml`。如姓名、学号或 GitHub 用户名确需变更，请联系教师。

## 二、以后提交作业

整个课程期间继续使用同一个学号分支，不要为每次作业另建分支，也不要删除该分支。

### 1. 同步教师仓库

开始新作业前执行：

```bash
cd verilog-homework-2026
git fetch upstream
git switch 240201101
git merge upstream/main
```

将 `240201101` 替换为自己的学号。

如果 Git 提示存在冲突，不要随意删除文件，请保留终端提示并联系教师。

### 2. 创建作业目录

例如提交 HW01：

```bash
mkdir -p students/240201101/HW01
```

把作业文件放在自己的作业目录中，例如：

```text
students/240201101/
├── .student.yml
└── HW01/
    ├── top.v
    └── top_tb.v
```

具体文件名以每次作业要求为准。

### 3. 提交作业

```bash
git status
git diff
git add students/240201101/HW01
git commit -m "240201101 HW01"
git push origin 240201101
```

提交前必须确认所有改动都位于：

```text
students/自己的学号/
```

### 4. 创建作业 PR

PR 仍然从自己的学号分支提交到教师仓库的 `main`：

```text
自己的学号 → main
```

标题格式：

```text
[240201101] HW01 - 王明
```

提交后等待自动检查和教师审核。自动检查主要验证：

- PR 作者及 Fork 所有者是否与绑定的 GitHub 用户名一致；
- 分支名是否为本人学号；
- 是否只修改 `students/本人学号/`；
- 是否修改或删除了 `.student.yml`；
- 重命名前后的路径是否都属于本人目录。

## 三、教师要求修改时

如果教师在 PR 中提出修改意见，不要新建 PR。在本地修改后继续提交到同一学号分支：

```bash
git add students/240201101/HW01
git commit -m "240201101 HW01 fix"
git push origin 240201101
```

原 PR 会自动更新，自动检查也会重新运行。

## 四、常见检查错误

| 检查提示 | 原因 | 处理方法 |
| --- | --- | --- |
| `Unknown student ID` | 学号尚未绑定，或分支名错误 | 检查分支名；如尚未注册，联系教师 |
| `GitHub username does not match` | PR 用户与已绑定账号不同 | 使用本人已绑定的 GitHub 账号 |
| `Head repository owner does not match` | PR 来源 Fork 不属于已绑定账号 | 从本人 Fork 的学号分支提交 |
| `Unauthorized path` | 修改了本人目录以外的文件 | 撤销越界修改后再次 Push |
| `Registration file is locked` | 修改或删除了 `.student.yml` | 恢复该文件；需变更身份时联系教师 |

不要重复创建 PR。修正本地文件后 `commit`、`push`，原 PR 会自动更新。

## 五、每次提交前检查

- [ ] 登录的是自己的 GitHub 账号；
- [ ] 当前分支是自己的 9 位学号；
- [ ] 只修改了 `students/自己的学号/`；
- [ ] 没有修改 `.student.yml`；
- [ ] 没有修改其他学生或课程公共文件；
- [ ] 已执行 `git status` 和 `git diff`；
- [ ] PR 目标仓库为 `rosickey/verilog-homework-2026`；
- [ ] PR 目标分支为 `main`；
- [ ] 自动检查已经通过。

## 六、最常用命令

```bash
# 查看当前分支
git branch --show-current

# 查看修改状态
git status

# 同步教师仓库
git fetch upstream
git switch 240201101
git merge upstream/main

# 提交并上传
git add students/240201101/HW01
git commit -m "240201101 HW01"
git push origin 240201101
```

请把所有示例中的 `240201101` 替换为自己的真实学号。
