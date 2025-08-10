@echo off
:: =====================================================
:: 启动 Vue3 项目脚本 (完全版)
:: 项目路径: D:\VS code\WorkSpace2\vue3-wei-starter
:: 作者: 自动化脚本
:: 日期: %date%
:: 功能: 检查环境、安装依赖、启动服务、自动打开浏览器
:: =====================================================

:: 设置编码为 UTF-8，避免中文乱码
chcp 65001 >nul

:: 定义颜色代码（ANSI 颜色，适用于现代终端如 Windows Terminal）
set "GREEN=[32m"
set "RED=[31m"
set "YELLOW=[33m"
set "RESET=[0m"

echo %GREEN%=====================================================%RESET%
echo        开始启动 Vue3 项目：vue3-wei-starter
echo %GREEN%=====================================================%RESET%

:: 检查 Node.js 是否安装
where node >nul 2>&1
if %errorlevel% neq 0 (
    echo %RED%[错误]%RESET% 未找到 Node.js。请确保已安装 Node.js 并添加到系统 PATH。
    echo 请访问 https://nodejs.org 下载并安装。
    pause
    exit /b 1
)

:: 检查 npm 是否可用
where npm >nul 2>&1
if %errorlevel% neq 0 (
    echo %RED%[错误]%RESET% 未找到 npm。请检查 Node.js 安装是否完整。
    pause
    exit /b 1
)

:: 转到项目目录
set PROJECT_DIR=D:\VS code\WorkSpace2\vue3-wei-starter

if not exist "%PROJECT_DIR%" (
    echo %RED%[错误]%RESET% 项目目录不存在：%PROJECT_DIR%
    echo 请检查路径是否正确，或项目是否已克隆。
    pause
    exit /b 1
)

cd /d "%PROJECT_DIR%"

echo %GREEN%[信息]%RESET% 已进入项目目录：%cd%

:: 检查是否存在 package.json
if not exist "package.json" (
    echo %RED%[错误]%RESET% 当前目录中未找到 package.json 文件！
    echo 可能是项目文件损坏或路径错误。
    pause
    exit /b 1
)

:: 可选：自动安装依赖（如果 node_modules 不存在）
if not exist "node_modules" (
    echo %YELLOW%[提示]%RESET% 检测到 node_modules 不存在，正在安装依赖...
    call npm install
    if %errorlevel% neq 0 (
        echo %RED%[错误]%RESET% npm install 失败，请检查网络或 package.json 配置。
        pause
        exit /b 1
    )
    echo %GREEN%[成功]%RESET% 依赖安装完成。
)

:: 启动开发服务器（在新窗口中运行）
echo %GREEN%[信息]%RESET% 正在启动开发服务器 (npm run dev)...
start "Vue3 开发服务器" cmd /c "npm run dev"

:: 等待 5 秒，让 Vite 服务器启动（默认端口 5173）
echo %GREEN%[信息]%RESET% 正在等待服务器启动...5 秒后自动打开浏览器。
:: 使用 ping 模拟延迟（-n 6 表示 5 秒）
ping 127.0.0.1 -n 6 >nul

:: 自动打开默认浏览器
start "" "http://localhost:5173"

echo %GREEN%[信息]%RESET% 已启动服务并尝试打开浏览器：http://localhost:5173

:: 提示用户脚本已完成（服务在另一个窗口运行，可保持）
echo.
echo %GREEN%[完成]%RESET% 脚本执行结束。开发服务器正在运行中。
echo 请勿关闭 "Vue3 开发服务器" 窗口。
pause