#Coulomb_Scattering

set terminal jpeg enhanced font "Times" 20 size 600, 480
set tics font 'Times,12'
set nokey
set ticslevel 0

#���
wx=10.0
wy=8.0
set xr[-wx*0.5:wx*0.5]
set yr[-wy*0.5:wy*0.5]

ASIZE=2*15

#�z��Ƀf�[�^���i�[����֐����`���邽�߂̕�����̐���
str_qx = "qx_set(i,x) = "
str_qy = "qy_set(i,x) = "
str_px = "px_set(i,x) = "
str_py = "py_set(i,x) = "
do for [k=0:ASIZE-1] {str_qx = str_qx . sprintf("(int(i)==%d ? _qx%d=x :", k, k)}
do for [k=0:ASIZE-1] {str_qy = str_qy . sprintf("(int(i)==%d ? _qy%d=x :", k, k)}
do for [k=0:ASIZE-1] {str_px = str_px . sprintf("(int(i)==%d ? _px%d=x :", k, k)}
do for [k=0:ASIZE-1] {str_py = str_py . sprintf("(int(i)==%d ? _py%d=x :", k, k)}
str_qx = str_qx. "1/0"
str_qy = str_qy. "1/0"
str_px = str_px. "1/0"
str_py = str_py. "1/0"
do for [k=0:ASIZE-1] {str_qx = str_qx . ")"}
do for [k=0:ASIZE-1] {str_qy = str_qy . ")"}
do for [k=0:ASIZE-1] {str_px = str_px . ")"}
do for [k=0:ASIZE-1] {str_py = str_py . ")"}
#��������s
eval str_qx
eval str_qy
eval str_px
eval str_py

#�z��̃f�[�^���Q�Ƃ���֐����`���邽�߂̕�����̐���
str_qx = "qx_get(i) = "
str_qy = "qy_get(i) = "
str_px = "px_get(i) = "
str_py = "py_get(i) = "
do for [k=0:ASIZE-1] {str_qx = str_qx . sprintf("(int(i)==%d ? _qx%d :", k, k)}
do for [k=0:ASIZE-1] {str_qy = str_qy . sprintf("(int(i)==%d ? _qy%d :", k, k)}
do for [k=0:ASIZE-1] {str_px = str_px . sprintf("(int(i)==%d ? _px%d :", k, k)}
do for [k=0:ASIZE-1] {str_py = str_py . sprintf("(int(i)==%d ? _py%d :", k, k)}
str_qx = str_qx. "1/0"
str_qy = str_qy. "1/0"
str_px = str_px. "1/0"
str_py = str_py. "1/0"
do for [k=0:ASIZE-1] {str_qx = str_qx . ")"}
do for [k=0:ASIZE-1] {str_qy = str_qy . ")"}
do for [k=0:ASIZE-1] {str_px = str_px . ")"}
do for [k=0:ASIZE-1] {str_py = str_py . ")"}
#��������s
eval str_qx
eval str_qy
eval str_px
eval str_py

DATA = "Coulomb_Scattering.data"
set print DATA

#�����l�E�W��
mass = 0.5
alpha = 1.5
R=wx*0.4
v0 = 3.0
do for [k=0:ASIZE-1] {dummy=qx_set(k,-wx*0.5)}
do for [k=0:ASIZE-1] {dummy=qy_set(k,(k-(ASIZE-1)*0.5)*0.2)}
do for [k=0:ASIZE-1] {dummy=px_set(k,mass*v0)}
do for [k=0:ASIZE-1] {dummy=py_set(k,0)}

#����������
partial_p(p) = (p)/(mass)
partial_qx(qx,qy) = -alpha*(qx-R)/(((qx-R)**2+qy**2)**(3/2))
partial_qy(qx,qy) = -alpha*qy/(((qx-R)**2+qy**2)**(3/2))
dt = 0.001    #���ԍ���
n_max = 500  #�Î~�搔
m_max = 20   #�Ԉ�����
n = 0;
m = 0
call "si2.plt"