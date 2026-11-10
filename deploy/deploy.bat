@echo off
chcp 65001 >nul
REM ============================================
REM  Chrono 日程 - 一键部署到阿里云 ECS
REM  用法: 修改下方 3 个变量后双击运行
REM  (首次会提示输入服务器密码; 建议配置 SSH 密钥免密)
REM ============================================

set SERVER_IP=你的服务器公网IP
set SERVER_USER=root
set REMOTE_DIR=/var/www/schedule

echo 正在上传到 %SERVER_USER%@%SERVER_IP%:%REMOTE_DIR% ...
scp index.html three.min.js xlsx.full.min.js "%SERVER_USER%@%SERVER_IP%:%REMOTE_DIR%/"
scp -r assets "%SERVER_USER%@%SERVER_IP%:%REMOTE_DIR%/"

if %errorlevel%==0 (
    echo.
    echo ✅ 上传完成! 浏览器访问 http://%SERVER_IP% 即可看到最新版本
    echo    (强刷 Ctrl+Shift+R 避免缓存)
) else (
    echo.
    echo ❌ 上传失败, 请检查网络与服务器信息
)
pause
