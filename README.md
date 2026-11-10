# 曦序日程
简约文艺风静态前端日程管理网页，数据本地存储，开箱即用。

## ✨ 功能清单
### 基础功能
- 日程新建、编辑、标记完成、删除
- 跨天任务存续期间每天可见，支持一键延长截止时间
- 任务分类筛选，卡片式日程展示
- 数据导出、一键清理已完成任务
- 浏览器本地持久化存储

### 创意特色
- 昼夜双主题切换：晨光日间 / 星空夜景两套场景
- 自定义页面名称，支持15字限制文艺励志铭
- Three.js 3D许愿灵树，完成任务生成发光果实
- 本周任务花园：7 天枝干时间轴可视化，发光果实 = 已完成、空心 = 未完成，一眼看清每天安排
- 本周每日详情：按天折叠的任务明细，与花园联动展开
- 已完成任务灰度细条沉底：点击或左滑展开操作，悬停浮现完成时间
- 完成彩蛋：每条任务完成时星尘闪烁，今日任务全部完成时全屏蓝黑流星雨划破夜幕
- 灵树养成：按本周完成任务数成长——3 项成长、8 项参天大树、15 项开花，每周一重新开始
- 按时间问候 + 随机诗意寄语，每次打开轮换
- WebAudio 合成音效：完成时风铃清响，全部完成时流星雨琶音（昼夜不同调，无需音频文件）
- 日程数据统计：本周任务概况、分类分布、优先级分布
- 沉浸式专注模式
- 莫兰迪磨砂玻璃UI，细腻微交互动效

## 🚀 运行部署
1. **本地使用**：浏览器直接打开 `index.html`
2. **公网分享**：支持部署 Vercel / 阿里云OSS / Gitee Pages 等静态平台
3. **阿里云 ECS**：
   - 项目为纯静态，只需 Nginx，无需 Node/数据库
   - 上传 `index.html`、`three.min.js`、`xlsx.full.min.js`、`assets/` 到服务器
   - Nginx 配置参考 `deploy/nginx.conf`，Windows 一键上传用 `deploy/deploy.bat`
   - 大陆服务器绑定域名需 ICP 备案（用 IP 直接访问则不需要）
   - 详情见下节「ECS 部署步骤」

> ⚠️ 部署提示：全部资源已本地化（three.js/xlsx/背景图/logo），无 CDN 依赖

## ☁️ 阿里云 ECS 部署步骤
```bash
# 1. 安装 Nginx (Ubuntu/Debian)
sudo apt update && sudo apt install -y nginx
# CentOS/Alibaba Cloud Linux 用: sudo yum install -y nginx

# 2. 创建网站目录
sudo mkdir -p /var/www/schedule

# 3. 上传文件 (在本地 Windows 执行, 或使用 deploy/deploy.bat)
#    scp index.html three.min.js xlsx.full.min.js root@服务器IP:/var/www/schedule/
#    scp -r assets root@服务器IP:/var/www/schedule/

# 4. 配置 Nginx
sudo cp deploy/nginx.conf /etc/nginx/conf.d/schedule.conf
sudo nano /etc/nginx/conf.d/schedule.conf   # 修改 server_name 为你的域名或IP

# 5. 生效
sudo nginx -t && sudo systemctl reload nginx

# 6. 阿里云控制台 → ECS → 安全组: 放行 80 端口 (和 443)
# 7. 浏览器访问 http://服务器IP 或你的域名
```

## 🛠 技术栈
HTML + CSS + 原生JavaScript + Three.js
纯前端项目，无需后端服务

## 📌 使用须知
- 数据保存在浏览器本地：换浏览器、换设备、或从不同域名打开，数据互不相通
- 跨浏览器迁移：在原浏览器点「导出备份」下载 JSON 文件，新浏览器点「导入备份」选择该文件
- 清理浏览器缓存会丢失日程，请定期导出备份
- 浏览器无痕模式关闭后不会保留任何数据
- 仅限个人非商用使用
