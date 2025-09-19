const BASE_URL = 'http://localhost:8080'

export const chatAPI = {
  async createNewChat(data) {
    console.log('createNewChat', data)
    try {
      const url = new URL(`${BASE_URL}/ai/history/create`)
      const response = await fetch(url, {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json', // 必须设置这个！
        },
        body: JSON.stringify(data)
      })

      if (!response.ok) {
        throw new Error(`HTTP error! status: ${response.status}`)
      }

      return response.body.getReader()
    } catch (error) {
      console.error('API Error:', error)
      throw error
    }
  },
  // 发送聊天消息
  async sendMessage(data, chatId) {
    try {
      const url = new URL(`${BASE_URL}/ai/chat`)
      if (chatId) {
        url.searchParams.append('chatId', chatId)
      }

      const response = await fetch(url, {
        method: 'POST',
        body: data instanceof FormData ? data :
          new URLSearchParams({ prompt: data })
      })

      if (!response.ok) {
        throw new Error(`HTTP error! status: ${response.status}`)
      }

      return response.body.getReader()
    } catch (error) {
      console.error('API Error:', error)
      throw error
    }
  },

  // 获取聊天历史列表
  async getChatHistory(type = 'chat') {  // 添加类型参数
    try {
      const response = await fetch(`${BASE_URL}/ai/history/list`)
      if (!response.ok) {
        throw new Error(`HTTP error! status: ${response.status}`)
      }
      // 转换为前端需要的格式
      return response.json()
    } catch (error) {
      console.error('API Error:', error)
      return []
    }
  },
  // 删除特定对话的消息历史
  async deleteChat(chatId, type = 'chat') {  // 添加类型参数
    try {
      const response = await fetch(`${BASE_URL}/ai/history/delete/${chatId}`)
      if (!response.ok) {
        throw new Error(`HTTP error! status: ${response.status}`)
      }
      const messages = await response.json()
      // 添加时间戳
      return messages
    } catch (error) {
      console.error('API Error:', error)
      return []
    }
  },
  // 获取特定对话的消息历史
  async getChatMessages(chatId, type = 'chat') {  // 添加类型参数
    try {
      const response = await fetch(`${BASE_URL}/ai/history/info/${chatId}`)
      if (!response.ok) {
        throw new Error(`HTTP error! status: ${response.status}`)
      }
      const messages = await response.json()
      // 添加时间戳
      return messages.map(msg => ({
        ...msg,
        timestamp: new Date() // 由于后端没有提供时间戳，这里临时使用当前时间
      }))
    } catch (error) {
      console.error('API Error:', error)
      return []
    }
  },

  // 发送游戏消息
  async sendGameMessage(prompt, chatId) {
    try {
      const response = await fetch(`${BASE_URL}/ai/game?prompt=${encodeURIComponent(prompt)}&chatId=${chatId}`, {
        method: 'GET',
      })

      if (!response.ok) {
        throw new Error(`HTTP error! status: ${response.status}`)
      }

      return response.body.getReader()
    } catch (error) {
      console.error('API Error:', error)
      throw error
    }
  },

  // 发送客服消息
  async sendServiceMessage(prompt, chatId) {
    try {
      const response = await fetch(`${BASE_URL}/ai/service?prompt=${encodeURIComponent(prompt)}&chatId=${chatId}`, {
        method: 'GET',
      })

      if (!response.ok) {
        throw new Error(`HTTP error! status: ${response.status}`)
      }

      return response.body.getReader()
    } catch (error) {
      console.error('API Error:', error)
      throw error
    }
  },

  // 发送 PDF 问答消息
  async sendPdfMessage(prompt, chatId) {
    try {
      const response = await fetch(`${BASE_URL}/ai/pdf/chat?prompt=${encodeURIComponent(prompt)}&chatId=${chatId}`, {
        method: 'GET',
        // 确保使用流式响应
        signal: AbortSignal.timeout(30000) // 30秒超时
      })

      if (!response.ok) {
        throw new Error(`API error: ${response.status}`)
      }

      // 返回可读流
      return response.body.getReader()
    } catch (error) {
      console.error('API Error:', error)
      throw error
    }
  }
}
