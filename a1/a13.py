# -*- coding: UTF-8 -*-
import numpy as np
import re
import sys
class Point:
    def __init__(self,ix,iy):
        self.x_=round(float(ix),2)
        self.y_=round(float(iy),2)
    def __str__(self):
        res="("+str(self.x_)+","+str(self.y_)+")"
        return res
    def __cmp__(self, other):
        if self.x_<other.x_:
            return -1
        elif self.x_==other.x_ and self.y_==other.y_:
            return 0
        else:
            return 1
    def equal(self,other):
        if abs(self.x_-other.x_)<0.0000001 and abs(self.y_-other.y_)<0.0000001:
            return True
        return False

class Edge:
    def __init__(self,p1,p2):
        self.start=p1
        self.end=p2


class Line:
    def __init__(self):
        self.points=[]
    def add(self,point):
        self.points.append(point)

    def remove(self,point):
        self.points.remove(point)

    

class Data:
    def __init__(self):
        self.graphs={}
        self.retPoints=[]
        self.retEdges=[]
        self.retCross=[]

    def add(self, street_name,line):
        self.graphs[street_name]=line

    def change(self,street_name,line):
        if street_name in self.graphs:
            self.graphs[street_name]=line

    def remove(self,street_name):
        self.graphs.pop(street_name)

    def has_point(self,p):
        ret=False
        for point in self.retPoints:
            if abs(point.x_-p.x_)<0.0000001 and abs(point.y_-p.y_)<0.0000001:
                ret=True
                break
        return ret

    def has_edge(self,e):
        ret=False
        for edge in self.retEdges:
            if abs(edge.start.x_-e.start.x_)<0.0000001 and abs(edge.start.y_-e.start.y_)<0.0000001 and abs(edge.end.x_-e.end.x_)<0.0000001 and abs(edge.end.y_-e.end.y_)<0.0000001:
                ret=True
                break
        return ret

    def indexEdge(self,e):
        s=e.start
        e=e.end
        indexOfs=-1
        indexOfe=-1
        for i in range(len(self.retPoints)):
            if abs(self.retPoints[i].x_-s.x_)<0.0000001 and abs(self.retPoints[i].y_-s.y_)<0.0000001:
                indexOfs=i
                break
        for i in range(len(self.retPoints)):
            if abs(self.retPoints[i].x_ - e.x_) < 0.0000001 and abs(self.retPoints[i].y_ - e.y_) < 0.0000001:
                indexOfe = i
                break
        return indexOfs,indexOfe

#line1:(p1,p2)  line2(p3,p4)
    def get_line_crossing( self,p1,p2,p3,p4):
        xa, ya = p1.x_, p1.y_
        xb, yb =  p2.x_, p2.y_
        xc, yc =  p3.x_, p3.y_
        xd, yd =  p4.x_, p4.y_
        # 判断两条直线是否相交，矩阵行列式计算
        a = np.matrix(
            [
                [xb - xa, -(xd - xc)],
                [yb - ya, -(yd - yc)]
            ]
        )
        delta = np.linalg.det(a)
        # 不相交,返回两线段
        if np.fabs(delta) < 1e-6:
            if self.onSegment():
                
            else: 
                return None
        # 求两个参数lambda和miu
        c = np.matrix(
            [
                [xc - xa, -(xd - xc)],
                [yc - ya, -(yd - yc)]
            ]
        )
        d = np.matrix(
            [
                [xb - xa, xc - xa],
                [yb - ya, yc - ya]
            ]
        )
        lamb = np.linalg.det(c) / delta
        miu = np.linalg.det(d) / delta
        # 相交
        if lamb <= 1 and lamb >= 0 and miu >= 0 and miu <= 1:
            x = xc + miu * (xd - xc)
            y = yc + miu * (yd - yc)
            return Point(x, y)
        # 相交在延长线上
        else:
            return None

    def onSegment(self,Pi, Pj, Q):
        if Q==Pi or Q==Pj:
            return False

        if ((Q.x_ - Pi.x_) * (Pj.y_ - Pi.y_) == (Pj.x_ - Pi.x_) * (Q.y_ - Pi.y_) and
                    min(Pi.x_, Pj.x_) <= Q.x_ and Q.x_ <= max(Pi.x_, Pj.x_) and
                    min(Pi.y_, Pj.y_) <= Q.y_ and Q.y_ <= max(Pi.y_, Pj.y_)):
            return True
        else:
            return False

    def compute(self):
        self.retEdges=[]
        self.retPoints=[]
        self.retCross=[]
        lines=list(self.graphs.values())
        length=len(lines)
        i=0
        while i<length-1:
            j=i+1
            while j<length:
                lineA=lines[i]
                lineB=lines[j]
                m=0
                while m<len(lineA.points)-1:
                    p1=lineA.points[m]
                    p2=lineA.points[m+1]
                    m=m+1
                    n=0
                    while n<len(lineB.points)-1:
                        p3=lineB.points[n]
                        p4=lineB.points[n+1]
                        cross=self.get_line_crossing(p1,p2,p3,p4)
                        if cross:
                            if  not self.has_point(p1):
                                 self.retPoints.append(p1)
                            if not self.has_point(p2):
                                 self.retPoints.append(p2)
                            if not self.has_point(p3):
                                  self.retPoints.append(p3)
                            if not self.has_point(p4):
                                  self.retPoints.append(p4)
                            if  not self.has_point(cross):
                                self.retPoints.append(cross)
                                self.retCross.append(cross)
                            g1=Edge(p1,cross)
                            g2=Edge(p2,cross)
                            g3=Edge(p3,cross)
                            g4=Edge(p4,cross)
                            if not self.has_edge(g1):
                                 self.retEdges.append(g1)
                            if not self.has_edge(g2):
                                self.retEdges.append(g2)
                            if not self.has_edge(g3):
                                 self.retEdges.append(g3)
                            if not self.has_edge(g4):
                                 self.retEdges.append(g4)
                        n=n+1
                j = j + 1
            i=i+1

       # self.display()

        bakEdges=[]
        while len(self.retEdges):
            edge=self.retEdges.pop(0)
            flag=True
            for node in self.retCross:
                if self.onSegment(edge.start,edge.end,node):
                    g1=Edge(edge.start,node)
                    g2=Edge(node,edge.end)
                    bakEdges.append(g1)
                    bakEdges.append(g2)
                    flag=False
            if flag:
                bakEdges.append(edge)
        for edge in bakEdges:
            tempG=Edge(edge.end,edge.start)
            if not self.has_edge(edge) and not self.has_edge(tempG) and not edge.start.equal(edge.end) :
                self.retEdges.append(edge)

        self.display()

    def parseCommand(self,strCom,graphs):
        patac = r'^(([ac])\s"(.*)"\s((\(-?[0-9]{1,},-?[0-9]{1,}\)\s?)*))$'
        patg=r'g'
        patr=r'(r\s"(.*)")'


        comType=''
        street_name=''
        lineStr=''

        if re.match(patg,strCom):
            self.compute()
        elif re.match(patr,strCom):
            ret=re.match(patr,strCom)
            street_name=ret.group(2).lower()
            if street_name in graphs.keys():
                self.remove(street_name)
            else:
                print "Error:’r’ specified for a street that does not exist"

        elif re.match(patac,strCom):
            ret = re.match(patac, strCom)
            comType=ret.group(2)
            street_name=ret.group(3).lower()
            lineStr=ret.group(4)
            line=Line()

            linePat=r'\(-?[0-9]{1,},-?[0-9]{1,}\)'
            pointLst=re.findall(linePat,lineStr)
            for ele in pointLst:
                tempat = r'\((-?[0-9]{1,}),(-?[0-9]{1,})\)'
                temres = re.match(tempat, ele)
                if temres:
                    point=Point(int(temres.group(1)),int(temres.group(2)))
                    line.add(point)

            if comType=='a':
                if street_name in graphs.keys():
                    print "Error:’a’ specified for a street that has existed"
                else:
                    self.add(street_name,line)
            elif  comType=='c':
                if street_name in graphs.keys():
                    self.change(street_name,line)
                else:
                    print "Error:’c’ specified for a street that does not exist"
            else:
                pass

        else:
            print "Error:input error format!"

    def display(self):
        i=1
        print "V={"
        for point in self.retPoints:
            print "%d: %s"%(i,point)
            i=i+1
        print "}"
        print "E={"
        for edge in self.retEdges:
            ins,ine=self.indexEdge(edge)
            print "<%d,%d>"%(ins+1,ine+1)
        print "}"


if __name__=='__main__':
    d=Data()
    while True:
        print 'read a line:'
        strCom=sys.stdin.readline()
        if strCom=='\n':
            break
        d.parseCommand(strCom,d.graphs)
    print 'Finished reading input'