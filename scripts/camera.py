import rclpy
from sensor_msgs.msg import CompressedImage
import cv2
from cv_bridge import CvBridge

def image_callback(msg):
    bridge = CvBridge()
    image = bridge.compressed_imgmsg_to_cv2(msg)
    cv2.imshow('Compressed Image Viewer', image)
    cv2.waitKey(1)

def main(args=None):
    rclpy.init(args=args)
    node = rclpy.create_node('image_viewer')

    # Suscribirse al tema de la imagen comprimida
    node.create_subscription(CompressedImage, '/camera/color/image_raw/compressed', image_callback, 10)

    rclpy.spin(node)

    # Cerrar la ventana de OpenCV
    cv2.destroyAllWindows()

    node.destroy_node()
    rclpy.shutdown()

if __name__ == '__main__':
    main()