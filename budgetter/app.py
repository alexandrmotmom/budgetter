import os

from sanic import Sanic
from aiogram import Bot, Dispatcher, executor, types

app = Sanic(__name__)
bot = Bot(
    token=os.environ.get('TELEGRAMM_TOKEN'),
    proxy='http://65.152.119.226:46620')


dp = Dispatcher(bot)
@dp.message_handler(commands=['start', 'help'])
async def send_welcome(message):
    await message.reply("Hi!\nI'm EchoBot!\nPowered by aiogram.")


if __name__ == '__main__':
    executor.start_polling(dp, skip_updates=True)
