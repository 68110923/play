import time,requests,json
from selenium import webdriver
from selenium.webdriver.common.desired_capabilities import DesiredCapabilities
from PIL import Image
import matplotlib.pyplot as plt

print(
'''---------------------------------------------必读--------------------------------------
1） 已经把要秒杀的商品放入购物车
2） 电脑中已经配置好的python环境
3） python环境中已经安装好了selenium和requests
4） 电脑已经配置完整地ChromeDriver
5)  准备好手机淘宝扫码登录
6） 时间格式为：YYYY-mm-dd HH:MM:SS

完成以上4步 直接在cmd窗口的该文件的路径下执行如下命令：
python TaobaoSeckill.py
---------------------------------------------------------------------------------------'''
)



class TaobaoSeckill:
    def __init__(self,seckill_time):
        self.time_difference=0
        self.seckill_time=seckill_time[0]
        # chrome_options = webdriver.ChromeOptions()  # 无头模式
        # chrome_options.add_argument("--headless")
        self.driver = webdriver.Chrome()





    def get_time_difference(self):
        # 淘宝时间戳-本地时间戳，求出时间差
        taobao_time_json=requests.get('http://api.m.taobao.com/rest/api3.do?api=mtop.common.getTimestamp',headers={
            'User-Agent':'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.7 Safari/537.36',
            'Host':'api.m.taobao.com',
        })
        taobao_timestamp=int(json.loads(taobao_time_json.text)['data']['t'])/1000
        this_time=time.time()
        self.time_difference=taobao_timestamp-this_time
        print(f'淘宝时间为：{time.strftime("%Y-%m-%d %S:%M:%S", time.localtime(taobao_timestamp))}')
        print(f'本地时间为:{time.strftime("%Y-%m-%d %S:%M:%S", time.localtime(this_time))}')
        print(f'淘宝时间-本地时间差为:{self.time_difference}')
        return self.time_difference
    def timing(self):
        # 时间差
        time_difference=self.get_time_difference()
        # 输入的时间转为10位int类型时间戳
        print(f'您设置的购买时间是淘宝时间：{self.seckill_time}')
        import_time=time.mktime(time.strptime(self.seckill_time, "%Y-%m-%d %H:%M:%S"))
        while True:
            this_time=time.time()+time_difference
            if int(import_time)-0.5==int(this_time)+0.5:
                print(f'买买买买买买买买买买买买买买买买买买买买买买买买买买买买买买买买买买买买买买买买买买买\n'
                      f'买                                                                          买\n'
                      f'买               开始购买时间戳(淘宝)：{this_time}                            买\n'
                      f'买               开始购买时间戳(本地)：{time.time()}                          买\n'
                      f'买               您设置的购买时间戳：{import_time}                            买\n'
                      f'买                                                                          买\n'
                      f'买              作者qq：68110923    出现bug请及时联系                         买\n'
                      f'买                                                                          买\n'
                      f'买                                                                          买\n'
                      f'买买买买买买买买买买买买买买买买买买买买买买买买买买买买买买买买买买买买买买买买买买买')
                return True
            else:
                time.sleep(0.01)
    def login_taobao(self):
        '''登录淘宝，并跳转到购物车'''
        desired_capabilities = DesiredCapabilities.CHROME  # 懒加载模式
        desired_capabilities["pageLoadStrategy"] = "none"
        self.driver.get('https://cart.taobao.com/cart.htm')
        self.driver.maximize_window()
        #扫码登录
        self.driver.find_element_by_xpath('//*[@id="login"]/div[1]/i').click()
        print(f'您有10秒钟的扫码时间')
        time.sleep(10)

        # 全选
        self.driver.find_element_by_xpath('//*[@id="J_SelectAll1"]/div/label').click()

        #等待时间到点
        self.timing()

        #点击结算
        self.driver.find_element_by_xpath('//*[@id="J_Go"]').click()

        #点击提交订单
        self.driver.find_element_by_xpath('//*[@id="submitOrderPC_1"]/div[1]/a[2]').click()
        print(f'下单时间戳(淘宝)：{time.time()+self.time_difference}')
        print(f'下单时间(淘宝)：{time.strftime("%Y-%m-%d %S:%M:%S",time.localtime(int(time.time()+self.time_difference)))}')

    def main(self):
        self.login_taobao()

if __name__ == '__main__':
    user_input_time=str(input('请输入您的定时时间(2020-04-28 17:20:00)为:'))
    TaobaoSeckill = TaobaoSeckill([user_input_time])
    TaobaoSeckill.main()





